package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.service.PlayResultService;
import com.springapp.mvc.footballStats.service.PlaybookService;
import com.springapp.mvc.footballStats.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;


public class PlayResultController {


}
