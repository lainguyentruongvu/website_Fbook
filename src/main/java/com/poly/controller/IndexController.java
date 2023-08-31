package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ImageDAO;
import com.poly.dao.ProofreadDAO;
import com.poly.entity.Account;
import com.poly.entity.Book;
import com.poly.entity.Image;
import com.poly.entity.Proofread;
import com.poly.service.ProductService;
import com.poly.service.SessionService;

@Controller
public class IndexController {
	@Autowired
	ProductService productService;

	@Autowired
	SessionService session;

	@Autowired
	ImageDAO imagedao;

	@Autowired
	ProofreadDAO proodreaddao;

	@Autowired
	CategoryDAO categoryDAo;

	@RequestMapping("/")
	public String index(Model model) {
		Account username1 = session.get("user");
		if (username1 == null) {
			return "User/index";
		} else {
			String aa = username1.getPhoto();
			model.addAttribute("acc", aa);
			return "User/index";
		}

	}

	@RequestMapping("/checkout")
	public String checkout(Model model) {
		return "User/checkout";
	}

	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Book item = productService.findById(id);
		List<Image> image = imagedao.findByBook(item);
		List<Proofread> proofread = proodreaddao.findByBook(item);
		model.addAttribute("item", item);
		model.addAttribute("image", image);
		model.addAttribute("proofread", proofread);

		return "User/book-page";
	}

	@RequestMapping("/oder")
	public String oder(Model model) {
		return "User/oder";
	}

	@RequestMapping("/favorite")
	public String favorite() {
		return "User/fav";
	}
	@RequestMapping("/favorite/error")
	public String error() {
		return "redirect:/";
	}

	@RequestMapping("/edit")
	public String edit(Model model) {
		return "User/profile-edit";
	}

	@GetMapping("vnpay/test/{total}")
	public String getTest(Model model, @PathVariable("total") Double total) {
		model.addAttribute("total", total);
		return "User/test";
	}

	@GetMapping("/vnpay/return")
	public String returnTest() {
		return "User/return";
	}
	
	@RequestMapping("/voucher")
	public String sanVouceher() {
		return "User/voucher";
	}

}
