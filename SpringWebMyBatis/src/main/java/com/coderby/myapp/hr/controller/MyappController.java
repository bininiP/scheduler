package com.coderby.myapp.hr.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coderby.myapp.hr.model.AssignVO;
import com.coderby.myapp.hr.model.EntVO;
import com.coderby.myapp.hr.model.LecVO;
import com.coderby.myapp.hr.model.MemberVO;
import com.coderby.myapp.hr.service.IMyappService;
@Controller
public class MyappController {

private static final Logger logger = LoggerFactory.getLogger(MyappController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	IMyappService myappService;

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale); Date date =
	 * new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * model.addAttribute("key",myappService.getEntCount());
	 * System.out.println(myappService.getEntCount()); String formattedDate =
	 * dateFormat.format(date); model.addAttribute("serverTime", formattedDate );
	 * return "home"; }
	 */
		
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		MemberVO mem = (MemberVO) session.getAttribute("member");
		List<Map<String,Object>> lec = myappService.getListLec(mem.getSeq_id());
		List<Map<String, Object>> ent = myappService.getListEnt(mem.getSeq_id());
		List<Map<String, Object>> assign = myappService.getListAssign(mem.getSeq_id());
		//System.out.println(assign);
		model.addAttribute("ent", ent);
		model.addAttribute("assign", assign);
		//System.out.println(mem.getMem_id());
		return "home";
	}
	
	// ----------list 占쏙옙占�------------
	@RequestMapping(value="/enterprise")
	public String getAllEnt(Model model,HttpSession session)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		List<Map<String, Object>>  ent_list = myappService.getListEnt(mem.getSeq_id());
		model.addAttribute("ent_list", ent_list); 
		return "sch/enterprise";
	}
	

	
	@RequestMapping(value="/lecture")
	public String getAllLec(Model model,HttpSession session)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		List<Map<String, Object>> lec_list = myappService.getListLec(mem.getSeq_id());
		model.addAttribute("lec_list", lec_list);
		List<Map<String, Object>> assign_list = myappService.getListAssign(mem.getSeq_id());
		model.addAttribute("assign_list",assign_list);
		return "sch/lecture";
	}
	
	// ------detail view page------------
	@RequestMapping(value="/lecture/{lec_id}")
	public String getIdLec(@PathVariable int lec_id, Model model)
	{
		int seq = myappService.getSeqFromLec(lec_id);
		LecVO lec = myappService.getLecInfo(lec_id, seq);
		model.addAttribute("lec", lec);
		return "sch/detail/lec_detail";
	}
	
	@RequestMapping(value="/enterprise/{ent_id}")
	public String getIdEnt(@PathVariable int ent_id, Model model)
	{
		int seq = myappService.getSeqFromEnt(ent_id);
		EntVO ent = myappService.getEntInfo(ent_id, seq);
		model.addAttribute("ent",ent);
		return "sch/detail/ent_detail";
	}
	
	
	//-------enterprise update, insert
	@RequestMapping(value="/enterprise/update")
	public String updateEnt( int ent_id, Model model)
	{
		
		  int seq = myappService.getSeqFromEnt(ent_id); 
		  model.addAttribute("ent",myappService.getEntInfo(ent_id,seq));
		 
		return "sch/update/update_ent";
	}
	
	@RequestMapping(value="/enterprise/update", method=RequestMethod.POST)
	public String updateEnt(HttpSession session, EntVO ent, Model model)
	{	
		MemberVO mem = (MemberVO) session.getAttribute("member");
		ent.setSeq_id(mem.getSeq_id());
		myappService.updateEnt(ent);
		return "redirect:/enterprise";
	}
	
	@RequestMapping(value="/enterprise/insert")
	public String insertEnt( Model model)
	{
		return "sch/insert/insert_ent";
	}
	
	@RequestMapping(value="/enterprise/insert",method=RequestMethod.POST)
	public String insertEnt(HttpSession session,EntVO ent, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		ent.setSeq_id(mem.getSeq_id());
		myappService.insertEnt(ent);
		return "redirect:/enterprise";
	}
	
	//-----------lecture update, insert
	@RequestMapping(value="/lecture/update")
	public String updateLec(int lec_id, Model model)
	{
		int seq = myappService.getSeqFromLec(lec_id);
		model.addAttribute("lec", myappService.getLecInfo(lec_id, seq));
		return "sch/update/update_lec";
	}
	
	@RequestMapping(value="/lecture/update", method=RequestMethod.POST)
	public String updateLec(HttpSession session,LecVO lec, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		lec.setSeq_id(mem.getSeq_id());
		myappService.updateLec(lec);
		return "redirect:/lecture";
	}
	
	@RequestMapping(value="/lecture/insert")
	public String insertLec( Model model)
	{
		return "sch/insert/insert_lec";
	}
	

	@RequestMapping(value="/lecture/insert", method=RequestMethod.POST)
	public String insertLec(HttpSession session,LecVO lec, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		lec.setSeq_id(mem.getSeq_id());
		myappService.insertLec(lec);
		return "redirect:/lecture";
	}

	//-----------------assignment insert
	
	@RequestMapping(value="/assign/insert")
	public String insertAssign(int lec_id,String lec_name, Model model)
	{
		return "sch/insert/insert_assign";
	}
	

	@RequestMapping(value="/assign/insert", method=RequestMethod.POST)
	public String inserAssign(HttpSession session, AssignVO as, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		as.setSeq_id(mem.getSeq_id());
		myappService.insertAssign(as);
		return "redirect:/lecture";
	}

	//-------------- mypage ----------------

	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String GetMemberInfo(HttpSession session,Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		model.addAttribute("mem",mem);
		//System.out.println("mypage:"+mem.getMem_name()+mem.getSeq_id());
		//model.addAttribute("mem", myappService.getMemberInfo("hello", "hi"));
		return "sch/mypage/mypage";
	}
	
//	@RequestMapping(value="/mypage/login", method=RequestMethod.GET)
//	public String MypageLogin(Model model)
//	{
////		//model.addAttribute("mem", myappService.getMemberInfo("hello", "hi"));
////		model.addAttribute("mem", mem);
//		return "sch/mypage/mypage_login";
//	}
//	
	@RequestMapping(value="/mypage/login", method=RequestMethod.POST)
	public String MypageLogin(HttpSession session,  Model model)
	{
		//model.addAttribute("mem", myappService.getMemberInfo("hello", "hi"));
		MemberVO mem = (MemberVO) session.getAttribute("member");
		model.addAttribute("mem", mem);
		return "sch/mypage/mypage_login";
	}
	
	@RequestMapping(value="/mypage/update", method=RequestMethod.GET)
	public String updateMember(HttpServletRequest req,Model model)
	{
		HttpSession session = req.getSession(true);
		MemberVO mem = (MemberVO) session.getAttribute("member");
		//System.out.println("update  "+mem.getMem_name());
		model.addAttribute("mem", mem);
		return "sch/update/update_mem";
	}
	
	//다른것도 이렇게 다 바꿔야하나?--------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/mypage/update", method=RequestMethod.POST)
	public String updateMember(MemberVO tmp_mem, HttpSession session, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		if(!tmp_mem.getMem_id().equals(mem.getMem_id()))
		{
			mem.setMem_id(tmp_mem.getMem_id());
		}
		if(!tmp_mem.getMem_pw().equals(mem.getMem_pw()))
		{
			mem.setMem_pw(tmp_mem.getMem_pw());
		}
		if(!tmp_mem.getMem_name().equals(mem.getMem_name()))
		{
			mem.setMem_name(tmp_mem.getMem_name());
		}
		myappService.updateMember(mem);
		session.setAttribute("member",mem);
		return "redirect:/mypage";
	}
	
	
	@RequestMapping(value="/mypage/delete", method=RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		myappService.deleteMember(mem.getSeq_id());
		return "redirect:/member/logout";
	}
	
	
	//----------delete------------
	@RequestMapping(value="/lecture/delete", method=RequestMethod.GET)
	public String deleteLecG(int lec_id, Model model)
	{
		int seq = myappService.getSeqFromLec(lec_id);
		model.addAttribute("lec",myappService.getLecInfo(lec_id,seq) );
		return "sch/delete/delete_lec";
	}
	
	@RequestMapping(value="/lecture/delete", method=RequestMethod.POST)
	public String deleteLec(int lec_id, Model model)
	{
		int seq = myappService.getSeqFromLec(lec_id);
		myappService.deleteLec(lec_id,seq);
		return "redirect:/lecture";   
	}

	@RequestMapping(value="/assign/delete", method=RequestMethod.GET)
	public String deleteAssignG(HttpSession session,int lec_id, String asign_name, Model model)
	{
		MemberVO mem = (MemberVO) session.getAttribute("member");
		model.addAttribute("assign",myappService.getAssignInfo(lec_id, asign_name,mem.getSeq_id()) );
		return "sch/delete/delete_as";
	}
	
	@RequestMapping(value="/assign/delete", method=RequestMethod.POST)
	public String deleteAssign(int lec_id, String asign_name,HttpSession session, Model model)
	{ 
		MemberVO mem = (MemberVO) session.getAttribute("member");
		myappService.deleteAssign(lec_id, asign_name,mem.getSeq_id());
		return "redirect:/lecture";
	}


	@RequestMapping(value="/enterprise/delete", method=RequestMethod.GET)
	public String deleteEntG(int ent_id, Model model)
	{
		int seq = myappService.getSeqFromEnt(ent_id);
		model.addAttribute("ent",myappService.getEntInfo(ent_id,seq));
		return "sch/delete/delete_ent";
	}
	
	@RequestMapping(value="/enterprise/delete", method=RequestMethod.POST)
	public String deleteEnt(int ent_id, Model model)
	{
		int seq = myappService.getSeqFromEnt(ent_id);
		myappService.deleteEnt(ent_id,seq);
		return "redirect:/enterprise";
	}
	
	//----------Login------------
	
	@RequestMapping(value="/")
	public String login(Model model)throws Exception{
	
		return "sch/login/login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String login(MemberVO member, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		HttpSession session = req.getSession();
		
		String mem_id = member.getMem_id();
		String mem_pw = member.getMem_pw();

		List<Map<String, Object>> list = myappService.getListMember();
		//System.out.println(list);
		MemberVO login = null;
		
		for (Map<String, Object> map : list) {
			if(map.get("mem_id").equals(mem_id)) {
				login = myappService.getMemberInfo(mem_id,mem_pw);	
			}
		}
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/";
		}else {
			session.setAttribute("member", login);
			return "redirect:/home";
		}
		
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
	public String register() throws Exception{
		return "sch/login/register";
	}
	
	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String registerMember(MemberVO member) throws Exception{
		
		myappService.insertMember(member);		
		return "redirect:/";
	}
	
	
}
