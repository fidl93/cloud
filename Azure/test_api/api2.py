from flask import Flask, request, jsonify
import logging
import pandas as pd

# Configuración de logging
logging.basicConfig(level=logging.INFO)

app = Flask(__name__)

@app.route('/api/tabla', methods=['POST'])

def recibir_tabla():
    try:
        tabla = request.get_json()
        
        # Convertir la tabla en un DataFrame de pandas para un formato más legible
        df = pd.DataFrame(tabla[1:], columns=tabla[0])
        logging.info("Datos recibidos:\n%s", df.to_string())

        return jsonify({"mensaje": "Tabla recibida correctamente"}), 200
    
    except Exception as e:
        logging.error("Error al procesar los datos: %s", str(e))
        return jsonify({"error": "Hubo un problema con los datos enviados"}), 400

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
