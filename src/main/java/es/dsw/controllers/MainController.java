package es.dsw.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import es.dsw.configs.ApplicationData;



@Controller
public class MainController {
	
	@GetMapping(value = {"/","/index"})
	public String index(Model objModel) {
		//Se obtiene el beans que contiene los parámetros de los ficheros.
		ApplicationData beansData = ApplicationData.getApplicationData();
		//Se asigna al modelo
		objModel.addAttribute("ProyectData", beansData);
		
		return "index";
	}

} 
