<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Lookify!</title>
</head>
<body>
	<div class="container mt-5">
		<div>
			<div><a href="/songs/new">Add New</a></div>
			<div><a href="/songs/topsongs">Top Songs</a></div>
			
			
			<div>
				<form action="/search" method="post">
					<input type="search" name="artist"  />
					<button class="btn btn-primary">Search</button>
				</form>
			</div>
			
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Rating</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="song" items="${songs }">
					<tr>
						<td><a href="/songs/${song.id}">${song.name }</a></td>
						<td>${song.rating }</td>
						<td>
							<form action="/songs/delete/${song.id }" method="post">
								<input type="hidden" name="_method" value="delete" />
								<button class="btn btn-danger">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>