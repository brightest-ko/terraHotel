package controllor.action.reviewboard;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewCommentBean;
import reviewboard.ReviewDAO;

public class ReviewCommentDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcomment = new ReviewCommentBean();
		//int num2 = Integer.parseInt(request.getParameter("rev_no"));
		//reviewbean= reviewdao.commentinfo2(num2);//게시글 정보 갖구오기
		String sid = (String)session.getAttribute("user_id");//세션아이디
		String rid= request.getParameter("rev_id2");//게시글 아이디
		String cid= request.getParameter("rc_id11");//코멘트
		
		int num = Integer.parseInt(request.getParameter("rc_no"));//해당 코멘트 시퀀스
		int rev_num2 = Integer.parseInt(request.getParameter("rev_num2"));//해당 게시글 번호
		reviewcomment=reviewdao.commentinfo(num);  //정보 갖구와서 아이디 비교하기
		reviewbean = reviewdao.info(rev_num2);
		String rid_db = reviewbean.getRev_id();
		String cid_db= reviewcomment.getRc_id();
		String c_admin="admin";

		if(!((rid.equals(rid_db))||(sid.equals(rid_db))||(sid.equals(c_admin)))) {
			PrintWriter writer = response.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('삭제할 권한이 없습니다.');");
			writer.println("location.href='javascript:history.go(-1)'");			
			writer.println("</script>");
			writer.close();
			return null;
		}
		
		int xx = Integer.parseInt(request.getParameter("pageno"));
		int pageno = Integer.parseInt(request.getParameter("pageno"));//???
		
		//코멘트 delete 메소드 @@@@@
		 reviewdao.commentdelete(num);	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		forward.setRedirect(true);
		//./ReviewBoardDetailAction.ro?num="
		//+ reviewbean.getRev_num()
		forward.setUrl("./ReviewBoardDetailAction.ro?num="+rev_num2+"&pageno="+pageno);
		return forward;		
	}

}
