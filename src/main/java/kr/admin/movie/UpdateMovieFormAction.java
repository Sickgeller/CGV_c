package kr.admin.movie;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.CodeUtil;

public class UpdateMovieFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(!CodeUtil.isAdmin(req)) {
			return "redirect:/main/main.do";
		}
		MovieDAO dao = MovieDAO.getInstance();
		MovieVO movie = dao.getMovie(Integer.parseInt(req.getParameter("movie_id")));
		req.setAttribute("movie", movie);
		return "admin/movie/updateMovieForm.jsp";
		
	}

}
