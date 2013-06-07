package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value="/players")
public class PlayerController {

    @Autowired
	private PlayerService playerService;
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addPlayerPage(){
		ModelAndView modelAndView = new ModelAndView("add_player_form");
		modelAndView.addObject("player", new Player());
		return modelAndView;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView addingPlayer(@ModelAttribute Player player){
		ModelAndView modelAndView = new ModelAndView("home");
		playerService.addPlayer(player);
		
		String message = "Player was successfully added.";
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/list")  
    public ModelAndView listOfPlayers() {  
        ModelAndView modelAndView = new ModelAndView("list-of-players");  
          
        List<Player> players = playerService.getPlayers();  
        modelAndView.addObject("players", players);  
          
        return modelAndView;  
    }
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)  
    public ModelAndView editPlayerPage(@PathVariable Integer id) {  
        ModelAndView modelAndView = new ModelAndView("edit-player-form");  
        Player player = playerService.getPlayer(id);  
        modelAndView.addObject("player",player);  
        return modelAndView;  
    }  
      
    @RequestMapping(value="/edit/{id}", method=RequestMethod.POST)  
    public ModelAndView editingPlayer(@ModelAttribute Player player, @PathVariable Integer id) {  
          
        ModelAndView modelAndView = new ModelAndView("home");  
          
        playerService.updatePlayer(player);  
          
        String message = "player was successfully edited.";  
        modelAndView.addObject("message", message);  
          
        return modelAndView;  
    }  
      
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)  
    public ModelAndView deleteplayer(@PathVariable Integer id) {  
        ModelAndView modelAndView = new ModelAndView("home");  
        playerService.deletePlayer(id);  
        String message = "player was successfully deleted.";  
        modelAndView.addObject("message", message);  
        return modelAndView;  
    } 
}