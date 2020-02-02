package com.pro1.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;

@Controller
//@RequestMapping("/board/{boardAuth}")
@RequestMapping("/board/")
public class BoardMainFrame {

    private final String root_path = "/board/";

    private final String commonBoardFrame = "commonBoard";

    @RequestMapping(value = "/{boardType}")
    public String getBoardView(@PathVariable("boardAuth") String boardAuth, @PathVariable("boardType") String boardType,
	    Model model) {
	// TEST
	model.addAttribute("auth", boardAuth);

	/**
	 * boardAuth > admin , user , free boardType > view , insert , delete , update
	 * .. .etc
	 */
	model.addAttribute(Constant.BOARD_TYPE, boardType);
	return root_path + commonBoardFrame;
    }

    @RequestMapping(value = "/commonBoardView")
	public void cafetestjsp() {}

}
