package controllor.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;

public class AdminGotoShowMemberInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setUrl("/administration/AdminMemberUpdateView.jsp");
		return forward;
	}

}
