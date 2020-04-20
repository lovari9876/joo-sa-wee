package com.soninlawisdice.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.vo.TradeVO;

//FileUtils 는 첨부파일의 정보를 이용하여 여러가지 조작을 할 클래스
@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "C:\\sa-wee\\file\\";

	public List<Map<String, Object>> parseInsertFileIofn(MultipartHttpServletRequest mpreq)
			throws Exception {

		// Iterator 은 데이터들의 집합체에서 컬렉션으로부터 정볼르 얻어올 수 있는 인터페이스
		// ㅣList 나 배열은 순차적으로 데이터의 접근이 가능하지만 Map 등의 클래스들은 순차적으로 접근할 수가 없다.
		// Iterator 를 이용하여 Map 에 있는 데이터들을 while 문을 이용하여 순차적으로 접근한다.
		// getRandomString() 은 32글자의 랜덤한 문자열을 만들어서 반환해주는 기능을 한다.
		//Iterator<String> iterator = mpreq.getFileNames();

		List<MultipartFile> fileList = mpreq.getFiles("file");
		System.out.println("multipartFiel list 출력 : " + fileList);
		
		//MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		//int t_no = tradeVO.getT_no();

		File file = new File(filePath);

		if (file.exists() == false) {
			file.mkdirs();
		}
		
		for (MultipartFile mf : fileList) {
			//multipartFile = mpreq.getFile(iterator.next());

			if (mf.isEmpty() == false) { 
				originalFileName = mf.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				//저장되는 파일 이름은 중복을 피하기 위해서 랜덤 문자 필요
				storedFileName = getRandomString() + originalFileExtension;
				
				//원래  storedFileName 으로 해야함. 일단 급하니까 불러오기 편하기 위해서 이렇게 해놓음.
				file = new File(filePath + originalFileName);
				mf.transferTo(file);
				listMap = new HashMap<String, Object>();
				
				//listMap.put("T_NO", t_no);
				
				listMap.put("F_NAME", originalFileName);
				listMap.put("F_TYPE",originalFileExtension);
				listMap.put("F_PATH", filePath);
				list.add(listMap);
			} 
		}
		System.out.println("++++++++++++++++++++++++");
		System.out.println("FileUtils 에서 list 출력");
		System.out.println(list);
		System.out.println("+++++++++++++++++++++++++");
		return list;
		

	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	private static String makeThumbnail(String uploadPath,String path, String fileName) throws Exception{
		//이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일의 이름 생성
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		//썸네일의 이름을 리턴
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}
