import numpy as np
from fastapi import FastAPI, UploadFile, File
from PIL import Image
import io
import tensorflow as tf
import tf_keras as keras

app = FastAPI()
model = keras.models.load_model("my_model.keras", compile=False)

@app.post("/predict/")
async def predict(file: UploadFile = File(...)):
    contents = await file.read()
    image = Image.open(io.BytesIO(contents)).convert('RGB')
    image = image.resize((224, 224))
    image_array = np.array(image) / 255.0
    image_array = np.expand_dims(image_array, axis=0)
    
    prediction = model.predict(image_array)[0][0]
    label = "malignant" if prediction >0.5 else "benign"
    confidence = prediction if prediction >0.5 else 1-prediction 
    return {
        "prediction": label,
        "probability": float(confidence)
    }
