package com.cleanAndHonest.Action;

import java.util.List;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.VoteBiz;
import com.cleanAndHonest.Util.Json;
import com.cleanAndHonest.orm.Vote;

public class VoteAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private VoteBiz voteBiz;
	private Vote vote;
	private List<Vote> list;

	public void setVoteBiz(VoteBiz voteBiz) {
		this.voteBiz = voteBiz;
	}
	
	/**
	 * 前台页面显示投票信息
	 * @return
	 */
	public String pageIndex() {
		
		list = voteBiz.selVstate();
		Json json = new Json();
		
		if (list.size() > 0) {
			json.setSuccess(true);
			json.setObj(list);
			json.setMsg("查询成功");
		} else {
			json.setSuccess(false);
			json.setMsg("查询失败");
		}
		
		WriteJson(json);
		return null;
	}
	
	/**
	 * 后台查看投票信息
	 * @return
	 */
	public String select() {
		list = voteBiz.selectAll();
		
		return "select_vote";
	}
	
	/**
	 * 添加一个调查
	 * @return 重定向到后台查询投票的页面
	 */
	public String add(){
		String vname = request.getParameter("vname");
		String vnodes = request.getParameter("vnodes");
		System.err.println(vname);
		System.out.println(vnodes);
		String[] vnode = vnodes.split(",");
		
		for (int i = 0; i < vnode.length; i++) {
			vote = new Vote();
			vote.setVname(vname);
			vote.setVnode(vnode[i]);
			vote.setVhits(0);
			vote.setVstate(0);
			
			voteBiz.add(vote);
		}
		return "afSel";
	}
	
	/**
	 * 删除某调查的信息
	 * @return 重定向到后台查询投票的页面
	 */
	public String delete() {
		String vnames = request.getParameter("ids");
		String[] vname = vnames.split(",");
		Json json = new Json();

		for (int i = 0; i < vname.length; i++) {
			list = voteBiz.selectVname(vname[i]);
			for (int j = 0; j < list.size(); j++) {
				if (voteBiz.deleteVno(list.get(j).getVno())) {
					json.setSuccess(true);
					json.setMsg("删除成功");
				} else {
					json.setSuccess(false);
					json.setMsg("删除失败");
				}
			}
		}

		WriteJson(json);
		return null;
	}
	
	/**
	 * 修改调查的信息
	 * @return
	 */
	public String change() {
		String vname = request.getParameter("vname");
		list = voteBiz.selectVname(vname);
		
		return "change";
	}
	
	/**
	 * 查看某个调查的信息
	 * @return
	 */
	public String look() {
		String vname = request.getParameter("vname");
		list = voteBiz.selectVname(vname);
		
		return "look";
	}
	
	/**
	 * 对调查中的某项投票
	 * @return ajax 调用 ，无返回值
	 */
	public String subIDs(){
		String vnames = request.getParameter("ids");
		String[] vnode = vnames.split(",");
		Json json = new Json();

		for (int i = 0; i < vnode.length; i++) {
			vote = voteBiz.selectVnoOne(Integer.valueOf(vnode[i]));
			vote.setVhits(vote.getVhits()+1);
			voteBiz.update(vote);
		}
		json.setSuccess(true);
		json.setMsg("投票成功");

		WriteJson(json);
		return null;
	}
	
	public String subEdit(){
		String vname = request.getParameter("vname");
		String vnodes = request.getParameter("vnodes");
		String vstate = request.getParameter("vstate");
		
		String[] vnode = vnodes.split(",");
		
		if(vstate.equals("2")){
			list = voteBiz.selVstate();
			for(int i = 0; i < list.size(); i++){
				vote = list.get(i);
				vote.setVstate(1);
				voteBiz.update(vote);
			}
		}
		
		list = voteBiz.selectVname(vname);
		for(int j = 0; j < list.size(); j++){
			vote = list.get(j);
			vote.setVnode(vnode[j]);
			vote.setVstate(2);
			voteBiz.update(vote);
		}
		
		return "afSel";
	}
	

	/*****************get、set方法***************/
	public List<Vote> getList() {
		return list;
	}

	public void setList(List<Vote> list) {
		this.list = list;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

}
