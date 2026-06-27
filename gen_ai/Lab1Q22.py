# 22. Write a program to build a simple FastAPI application with a root endpoint returning a welcome message. 

from fastapi import FastAPI
import uvicorn

app = FastAPI(title="Lab 1 - Question 22", version="1.0")


@app.get("/")
def welcome():
    return {"message": "Welcome to the Generative AI Lab API!"}


def main():
    print("Starting server at http://127.0.0.1:9000")
    print("API docs:      http://127.0.0.1:9000/docs")
    print("Press Ctrl+C to stop.\n")
    uvicorn.run(app, host="127.0.0.1", port=9000)


if __name__ == "__main__":
    main()
