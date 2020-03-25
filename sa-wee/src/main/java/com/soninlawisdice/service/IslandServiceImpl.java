package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.IslandMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.TradeVO;

@Service("IslandService")
public class IslandServiceImpl implements IslandService {

	@Autowired
	private IslandMapper islandMapper;

	ArrayList<TradeVO> tList;
	ArrayList<Board_writeVO> bwList;
	// 카페리뷰 하나 추가해야 함
	public List<Object> iList = new ArrayList<>();

	// 생성자
	public IslandServiceImpl() {
	}

	public IslandServiceImpl(IslandMapper islandMapper) {
		super();
		this.islandMapper = islandMapper;
	}

	// 보부상에서 가져오기
	@Override
	public ArrayList<TradeVO> selectTradeIslandList() {
		return islandMapper.selectTradeIslandList();
	}

	// 게시글에서 가져오기
	@Override
	public ArrayList<Board_writeVO> selectBoard_writeIslandList() {
		return islandMapper.selectBoard_writeIslandList();
	}

	// iList 만들어서 3개의 게시판 글 하나로 모으기
	@Override
	public List<Object> getIslandList() {
//		iList.addAll(this.selectTradeIslandList());
//		iList.addAll(this.selectBoard_writeIslandList());

//		Object latest = iList.get(0); // 기준점 잡기

		tList = islandMapper.selectTradeIslandList();
		bwList = islandMapper.selectBoard_writeIslandList();

		List<Object> temp = new ArrayList<>();

//		TradeVO latest = tList.get(0);

		int i, j, k = 0;
		for (i = 0; i < tList.size(); i++) {
			for (j = k; j < bwList.size(); j++) {
				if (tList.get(i).getWrittenDate().compareTo(bwList.get(j).getWrittenDate()) <= 0) {
					// 작성일이 같으면 일단 bwVO부터 넣기(로직 수정 필요)
					// bwList.get(j)가 더 최근 글
					// (정렬 알고리즘 참고하여 더 빠른 정렬해보도록...)
					temp.add(bwList.get(j));
				} else {
					break; // j++ 까지 안가고 for문 빠져나온다.
				}
			}
			// 1) bwList의 모든 element를 다 temp에 넣은 경우
			// bwList가 다 temp에 들어가서 j=bwList.size()가되면 조건에 안들어가므로 내려오고,
			// 그 상태에서 k=j를 하므로 그다음부턴 아예 j for문으로 들어가지도 않는다.
			// 그러면 tList만 차례로 add하게 되는 것!
			temp.add(tList.get(i));
			k = j; // 나머지부터 다시 서로 비교
		}

		// 2) tList의 모든 element를 다 temp에 넣었는데, bwList가 남은 경우
		// 순서대로 추가
		if (temp.size() < (tList.size() + bwList.size())) {
			for (int l = k; l < bwList.size(); l++) {
				temp.add(bwList.get(l));
			}
		}

		iList = temp;

		//

//		3가지 게시판 합칠때에는 temp2 만들어서 temp와 list3를 비교하는 위의 로직 반복

		



		return iList;
	}	
	

// 고뇌의 흔적들....	
	
	// 어떤 타입인지 모르는 Object o로부터 writtenDate 가져오기
//	public Timestamp getWrittenDate(Object o) {
//		if (o instanceof TradeVO) {
//			return ((TradeVO) o).getT_written_date();
//		} else if (o instanceof Board_writeVO) {
//			return ((Board_writeVO) o).getBw_written_date();
//		} else {
//			System.out.println("object가 TradeVO 나 Board_writeVO 둘 다 아님");
//			return null;
//		}
//	}	

//	if ( timestamp1.compareTo(timestamp2) < 0 ) {
//		  // timestamp2 is later than timestamp 1
//		}	

//	List<Object> combined = new ArrayList<>();
//	combined.addAll(first);
//	combined.addAll(second);

//	ArrayList<> iList = null;

// 참고	

//	@Inject
//	EmpMapper empMapper;
//	
//	public ArrayList<EmpVO> selectAllEmpList() {
//			return empMapper.selectAllEmpList() ;
//   }
//		
//   public DeptEmpVO selectEmpDeptName(int deptno) {
//		return empMapper.selectEmpDeptName(deptno) ;
//   }
//   
//	public ArrayList<HashMap<String,Object>> selectAllEmpListHashMap() {
//		return empMapper.selectAllEmpListHashMap() ;
//}

}