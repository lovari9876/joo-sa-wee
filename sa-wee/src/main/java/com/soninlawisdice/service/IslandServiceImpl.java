package com.soninlawisdice.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
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
	// 카페리뷰 하나 추가
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
		tList = islandMapper.selectTradeIslandList();

		return tList;
	}

	// 게시글에서 가져오기
	@Override
	public ArrayList<Board_writeVO> selectBoard_writeIslandList() {
		bwList = islandMapper.selectBoard_writeIslandList();

		return bwList;
	}

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

	// iList 만들어서 3개의 게시판 글 하나로 모으기
	public List<Object> islandList() {
//		iList.addAll(this.selectTradeIslandList());
//		iList.addAll(this.selectBoard_writeIslandList());

		
//		Object latest = iList.get(0); // 기준점 잡기

		tList = islandMapper.selectTradeIslandList();
		bwList = islandMapper.selectBoard_writeIslandList();
		
		List<Object> temp = new ArrayList<>();

//		TradeVO latest = tList.get(0);
		for (int i = 0; i < tList.size(); i++) {
			for (int j = 0; j < bwList.size(); j++) {
				if (tList.get(i).getWrittenDate().compareTo(bwList.get(j).getWrittenDate()) <= 0) { // 작성일이 같으면 일단 bwVO부터 넣기(로직 수정 필요)
					// bwList.get(j)가 더 최근 글 
					// 정렬 알고리즘
					temp.add(bwList.get(j));
				}
			}
		}
		
//		하나 더 필요하면...
//		temp2 만들기
		
		for (int i = 0; i < tList.size(); i++) {
			for (int j = 0; j < bwList.size(); j++) {
				if (tList.get(i).getWrittenDate().compareTo(bwList.get(j).getWrittenDate()) <= 0) { // 작성일이 같으면 일단 bwVO부터 넣기(로직 수정 필요)
					// bwList.get(j)가 더 최근 글 
					// 정렬 알고리즘
					temp.add(bwList.get(j));
				}
			}
		}
		
		iList = temp;
		
		
		
		// 대상 게시판이 하나씩 늘 때마다 한 번씩 더 하삼
		
		

//		iList.forEach(action);

//		for (int i = 0; i < iList.size(); i++) {
//			if ((iList.get instanceof TradeVO) && latest.getWrittenDate().compareTo(((TradeVO) o).getT_written_date()) < 0) {
//
//			}
//		}

		return iList;
	}

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