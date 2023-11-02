from api import db


class NetflixOriginal(db.Model):
    __tablename__ = 'netflix_originals'

    def __init__(self, title, genre, premiere, runtime, imdb_score, language):
        self.title = title
        self.genre = genre
        self.premiere = premiere
        self.runtime = runtime
        self.imdb_score = imdb_score
        self.language = language

    def serialize(self):
        return {
            'title': self.title,
            'genre': self.genre,
            'premiere': self.premiere,
            'runtime': self.runtime,
            'imdb_score': self.imdb_score,
            'language': self.language
        }

    title = db.Column(db.VARCHAR, primary_key=True)
    genre = db.Column(db.VARCHAR, nullable=True)
    premiere = db.Column(db.DATE, nullable=True)
    runtime = db.Column(db.INTEGER, nullable=True)
    imdb_score = db.Column(db.VARCHAR, nullable=True)
    language = db.Column(db.VARCHAR, nullable=True)

