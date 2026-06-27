# 25. Write a program to build a simple calculator API using FastAPI.

from fastapi import FastAPI, HTTPException
import uvicorn

# Initialize the FastAPI application
app = FastAPI(title="Lab 1 - Question 25")

# Endpoint for addition
@app.get("/add")
def add(num1: float, num2: float):
    return {"operation": "add", "result": num1 + num2}

# Endpoint for subtraction
@app.get("/subtract")
def subtract(num1: float, num2: float):
    return {"operation": "subtract", "result": num1 - num2}

# Endpoint for multiplication
@app.get("/multiply")
def multiply(num1: float, num2: float):
    return {"operation": "multiply", "result": num1 * num2}

# Endpoint for division, including error handling for zero
@app.get("/divide")
def divide(num1: float, num2: float):
    if num2 == 0:
        # Prevent server crash by returning a 400 Bad Request error
        raise HTTPException(status_code=400, detail="Cannot divide by zero")
    return {"operation": "divide", "result": num1 / num2}

# Run the server on port 9000           
def main():
    print("Starting Calculator API at http://127.0.0.1:9000")
    print("API docs: http://127.0.0.1:9000/docs")
    uvicorn.run(app, host="127.0.0.1", port=9000)

if __name__ == "__main__":
    main()