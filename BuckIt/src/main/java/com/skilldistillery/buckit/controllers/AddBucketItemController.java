package com.skilldistillery.buckit.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.buckit.dao.BucketItemDAO;
import com.skilldistillery.buckit.dao.CountryDAO;
import com.skilldistillery.buckit.dao.LocationDAO;
import com.skilldistillery.buckit.dao.UserBucketItemDAO;
import com.skilldistillery.buckit.dao.UserDAO;
import com.skilldistillery.buckit.entities.BucketItem;
import com.skilldistillery.buckit.entities.Country;
import com.skilldistillery.buckit.entities.Location;
import com.skilldistillery.buckit.entities.Note;
import com.skilldistillery.buckit.entities.Poll;
import com.skilldistillery.buckit.entities.Resource;
import com.skilldistillery.buckit.entities.User;
import com.skilldistillery.buckit.entities.UserBucketItem;

@Controller
public class AddBucketItemController {

	@Autowired
	private BucketItemDAO bucketDao;
	
	@Autowired
	private UserBucketItemDAO userBucketDao;

	@Autowired
	private LocationDAO locationDao;
	
	@Autowired
	private CountryDAO countryDao;
	
	@RequestMapping("newbucketitem.do")
	public String gotoMakeNewBucketItem(Model model) {	
		List<Country> countryList = countryDao.getAllCountries();

		model.addAttribute("countries", countryList);

		return "newBucketItem";
	}

	@RequestMapping(path = "newbucketinfo.do", method = RequestMethod.POST)
	public ModelAndView createNewBucketItem(BucketItem item, @RequestParam(name = "countryId") String country, Location location, HttpSession session) {
		ModelAndView mv = new ModelAndView();	
		User user = (User) session.getAttribute("loggedInUser");
		UserBucketItem userItem = new UserBucketItem();
		Country newCountry = new Country();
		
		if (country.length() == 3) {
			newCountry.setCountryCode(country);
			location.setCountryCode(newCountry);
		}
		
		
		
		if (location.getCityArea() != null && location.getCityArea() != "") {
			mv.addObject("location", locationDao.createLocation(location));
			item.setLocation(location);
		}
		
	
		item.setCreatedByUser(user);
		
		mv.addObject("item", bucketDao.createBucketItem(item));
		
		
		userItem.setBucketItem(item);
		userItem.setUser(user);
				
		mv.addObject("userItem", userBucketDao.createBucketItem(userItem));
		
		mv.setViewName("new-item-added");		

		return mv;
	}

}
