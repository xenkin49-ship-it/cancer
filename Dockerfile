FROM python:3.11-slim

WORKDIR /app
COPY . /app

# Εγκατάσταση της ΣΥΓΚΕΚΡΙΜΕΝΗΣ έκδοσης που δούλεψε στο Mac σου
RUN pip install --no-cache-dir tensorflow==2.15.0 fastapi uvicorn python-multipart Pillow numpy

EXPOSE 8000
CMD ["uvicorn", "jesus:app", "--host", "0.0.0.0", "--port", "8000"]
