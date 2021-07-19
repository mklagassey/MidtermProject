package com.skilldistillery.buckit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.buckit.dao.UserBucketItemDAO;
import com.skilldistillery.buckit.entities.Note;
import com.skilldistillery.buckit.entities.Resource;
import com.skilldistillery.buckit.entities.UserBucketItem;

@Controller
public class UserBucketItemController {
	
	@Autowired
	private UserBucketItemDAO daoUBI;
	
	@RequestMapping(path="editUserBucketItem.do", method=RequestMethod.GET)
	public String editUserBucketItemForm(int id, Model model) {
		model.addAttribute("userBucketItem", daoUBI.findByID(id));
		return "editUserBucketItemForm";
	}
	
	@RequestMapping(path="updateUserBucketItem.do", method=RequestMethod.POST)
	public String updateUserBucketItem(UserBucketItem userBucketItem, Model model) {
		model.addAttribute("userBucketItem", daoUBI.updateBucketItem(userBucketItem));
		return "userBucketListItem";
	}
	
	@RequestMapping(path="deleteUserBucketItem.do", method=RequestMethod.POST)
	public String deleteUserBucketItem(int id, Model model) {
		boolean deleted = daoUBI.deleteBucketItem(id);
		if(deleted) {
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(path="viewUserBucketItem.do", method=RequestMethod.GET)
	public String viewUserBucketItemDetails(Integer itemId, Model model) {
		model.addAttribute("userBucketItem", daoUBI.findByID(itemId));
		model.addAttribute("bucketItem", daoUBI.getBucketItemFromUserBucketItem(daoUBI.findByID(itemId)));
		return "userBucketListItem";
	}
	
	@RequestMapping(path="deleteNote.do", method=RequestMethod.POST)
	public String deleteNote(int id) {
		Note note = daoUBI.findNoteById(id);
		note.getUserBucketItem().removeNote(note);
		return "editUserBucketItemForm";
	}
		
	@RequestMapping(path="deleteResource.do", method=RequestMethod.POST)
	public String deleteResource(int id) {
		Resource resource = daoUBI.findResourceById(id);
		resource.getUserBucketItem().removeResource(resource);
		return "editUserBucketItemForm";
	}
	
	@RequestMapping(path="addNote.do", method=RequestMethod.GET)
	public String addNote(int id, Note note) {
		daoUBI.findByID(id).addNote(note);
		return "userBucketListItem";
	}
	
	@RequestMapping(path="addResource.do", method=RequestMethod.GET)
	public String addResource(Integer id, Resource resource, Model model) {
		System.out.println(resource);
		UserBucketItem userBucketItem = daoUBI.findByID(id);
		userBucketItem.addResource(resource);
		model.addAttribute("userBucketItem",userBucketItem);
		return "userBucketListItem";
	}
	
}
