FROM tensorflow/tensorflow:2.15.0

# Ορίζουμε τον φάκελο εργασίας μέσα στον server
WORKDIR /app

# Αντιγράφουμε τα αρχεία μας στον server
COPY . /app

# Εγκαθιστούμε τις βιβλιοθήκες
RUN pip install --no-cache-dir -r requirements.txt

# Ανοίγουμε την πόρτα 8000
EXPOSE 8000

# Η εντολή για να ξεκινήσει το API (άλλαξε το 'jesus' αν το αρχείο σου λέγεται αλλιώς)
CMD ["uvicorn", "jesus:app", "--host", "0.0.0.0", "--port", "8000"]
