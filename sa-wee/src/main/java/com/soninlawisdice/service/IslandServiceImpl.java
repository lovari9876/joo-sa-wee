package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.IslandMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.IslandVO;
import com.soninlawisdice.vo.TradeVO;

@Service("IslandService")
public class IslandServiceImpl implements IslandService {

	@Autowired
	private IslandMapper islandMapper;

	ArrayList<TradeVO> tList;
	ArrayList<Board_writeVO> bwList;
	ArrayList<Cafe_reviewVO> crList;

	public ArrayList<IslandVO> iList = new ArrayList<>();

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

	// 카페 리뷰에서 가져오기
	@Override
	public ArrayList<Cafe_reviewVO> selectCafe_reviewIslandList() {
		return islandMapper.selectCafe_reviewIslandList();
	}

	// iList 만들어서 3개의 게시판 글 하나로 모으기 다시.......................
	@Override
	public ArrayList<IslandVO> getIslandList() {
		tList = this.selectTradeIslandList();
		bwList = this.selectBoard_writeIslandList();
		crList = this.selectCafe_reviewIslandList();
		
		// 새로고침 시 리스트에 계속 추가되는 현상 막기.. 
		if (iList.size() == 0) {

			for (int i = 0; i < tList.size(); i++) {
				IslandVO islandVO = new IslandVO();

				// iListVO에 TradeVO넣기
				islandVO.setI_no(tList.get(i).getT_no());
				islandVO.setBt_no(tList.get(i).getBt_no());
				islandVO.setS_no(tList.get(i).getS_no());
				islandVO.setM_no(tList.get(i).getM_no());
				islandVO.setI_title(tList.get(i).getT_title());
				islandVO.setI_content(tList.get(i).getT_content());
				islandVO.setI_written_date(tList.get(i).getT_written_date());
				islandVO.setI_updated_date(tList.get(i).getT_updated_date());
				islandVO.setI_hit(tList.get(i).getT_hit());
				islandVO.setI_recommend_num(tList.get(i).getT_recommend_num());
				islandVO.setI_report_num(tList.get(i).getT_report_num());
				islandVO.setI_island(tList.get(i).getT_island());

				iList.add(islandVO);
			}

			for (int i = 0; i < bwList.size(); i++) {
				IslandVO iListVO = new IslandVO();

				// iListVO에 Board_writeVO넣기
				iListVO.setI_no(bwList.get(i).getBw_no());
				iListVO.setBt_no(bwList.get(i).getBt_no());
				iListVO.setS_no(bwList.get(i).getS_no());
				iListVO.setM_no(bwList.get(i).getM_no());
				iListVO.setI_title(bwList.get(i).getBw_title());
				iListVO.setI_content(bwList.get(i).getBw_content());
				iListVO.setI_written_date(bwList.get(i).getBw_written_date());
				iListVO.setI_updated_date(bwList.get(i).getBw_updated_date());
				iListVO.setI_hit(bwList.get(i).getBw_hit());
				iListVO.setI_recommend_num(bwList.get(i).getBw_recommend_num());
				iListVO.setI_report_num(bwList.get(i).getBw_report_num());
				iListVO.setI_island(bwList.get(i).getBw_island());

				iList.add(iListVO);
			}

			for (int i = 0; i < crList.size(); i++) {
				IslandVO iListVO = new IslandVO();

				// iListVO에 Cafe_reviewVO넣기
				iListVO.setI_no(crList.get(i).getCr_no());
				iListVO.setBt_no(crList.get(i).getBt_no());
				iListVO.setS_no(0); // 말머리가 없으므로, 임의로 0 넣는다.
				iListVO.setM_no(crList.get(i).getM_no());
				iListVO.setI_title(crList.get(i).getCr_title());
				iListVO.setI_content(crList.get(i).getCr_content());
				iListVO.setI_written_date(crList.get(i).getCr_written_date());
				iListVO.setI_updated_date(crList.get(i).getCr_updated_date());
				iListVO.setI_hit(crList.get(i).getCr_hit());
				iListVO.setI_recommend_num(crList.get(i).getCr_recommend_num());
				iListVO.setI_report_num(crList.get(i).getCr_report_num());
				iListVO.setI_island(crList.get(i).getCr_island());

				iList.add(iListVO);
			}

			// 정렬 로직
			Collections.sort(iList);
		}

		return iList;
	}

//	// iList 만들어서 3개의 게시판 글 하나로 모으기
//	
//	public List<Object> IslandList() {
////		iList.addAll(this.selectTradeIslandList());
////		iList.addAll(this.selectBoard_writeIslandList());
//
////		Object latest = iList.get(0); // 기준점 잡기
//
//		tList = islandMapper.selectTradeIslandList();
//		bwList = islandMapper.selectBoard_writeIslandList();
//
//		List<Object> temp = new ArrayList<>();
//
////		TradeVO latest = tList.get(0);
//
//		int i, j, k = 0;
//		for (i = 0; i < tList.size(); i++) {
//			for (j = k; j < bwList.size(); j++) {
//				if (tList.get(i).getWrittenDate().compareTo(bwList.get(j).getWrittenDate()) <= 0) {
//					// 작성일이 같으면 일단 bwVO부터 넣기(로직 수정 필요)
//					// bwList.get(j)가 더 최근 글
//					// (정렬 알고리즘 참고하여 더 빠른 정렬해보도록...)
//					temp.add(bwList.get(j));
//				} else {
//					break; // j++ 까지 안가고 for문 빠져나온다.
//				}
//			}
//			// 1) bwList의 모든 element를 다 temp에 넣은 경우
//			// bwList가 다 temp에 들어가서 j=bwList.size()가되면 조건에 안들어가므로 내려오고,
//			// 그 상태에서 k=j를 하므로 그다음부턴 아예 j for문으로 들어가지도 않는다.
//			// 그러면 tList만 차례로 add하게 되는 것!
//			temp.add(tList.get(i));
//			k = j; // 나머지부터 다시 서로 비교
//		}
//
//		// 2) tList의 모든 element를 다 temp에 넣었는데, bwList가 남은 경우
//		// 순서대로 추가
//		if (temp.size() < (tList.size() + bwList.size())) {
//			for (int l = k; l < bwList.size(); l++) {
//				temp.add(bwList.get(l));
//			}
//		}
//
//		iList = temp;
//
//		//
//
////		3가지 게시판 합칠때에는 temp2 만들어서 temp와 list3를 비교하는 위의 로직 반복
//
//
//		return iList;
//	}	

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