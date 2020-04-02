package com.soninlawisdice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.SearchCriteria;

/**
 * Handles requests for the application home page.
 */


@RestController
public class Board_hs_rest_Controller {

	@Autowired
	private BoardService boardService;
		
	
}
