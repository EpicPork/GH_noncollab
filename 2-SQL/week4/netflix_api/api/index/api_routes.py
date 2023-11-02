from . import api
from api import session, engine
from api.models import NetflixOriginal
from flask import jsonify
from sqlalchemy import desc, text



@api.route("/netflix_originals/all", methods=['GET'])
def all_movies():
    try:
        result = session.query(NetflixOriginal).all()
        format_result = [r.serialize() for r in result]
        return jsonify(format_result)
    except Exception as e:
        status = "Error! = " + str(e)
    return status


@api.route("/netflix_originals/all/titles", methods=['GET'])
def all_titles():
    try:
        sql = 'select title from netflix_originals'
        with engine.connect() as conn:
            result = conn.execute(text(sql))
        titles = [row[0] for row in result]
        return jsonify(titles)
    except Exception as e:
        status = "Error! = " + str(e)
    return status


@api.route("/netflix_originals/highest_rated", methods=['GET'])
def highest_rated():
    try:
        result = session.query(NetflixOriginal).order_by(desc(NetflixOriginal.imdb_score)).limit(1).all()
        format_result = [r.serialize() for r in result]
        return jsonify(format_result)
    except Exception as e:
        status = "Error! = " + str(e)
    return status


@api.route("/watched/<movie>/<rating>", methods=['POST'])
def record_watched(movie, rating):
    try:
        query = text(f"insert into watched (title, my_rating) values ('{movie}',{rating})")
        session.execute(query)
        session.commit()
        status = f'You gave {movie} a score of {rating}'
        return status
    except Exception as e:
        status = "Error! = " + str(e)
    return status


@api.route("/updated_watched/<movie>/<rating>", methods=['PUT'])
def updated_watched_rating(movie, rating):
    try:
        query = text(f"update watched set my_rating = {rating} where title = '{movie}'")
        session.execute(query)
        session.commit()
        status = f"You updated {movie}'s rating to {rating}"
        return status
    except Exception as e:
        status = "Error! = " + str(e)
    return status



