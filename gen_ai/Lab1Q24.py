# 24. Write a program to create a FastAPI endpoint that takes query parameters and returns a response. 

from fastapi import FastAPI
import uvicorn

app = FastAPI(title="Lab 1 - Question 24")

# Example endpoint: /search?category=books&limit=5
@app.get("/search")
def search_items(category: str, limit: int = 10):
    return {
        "message": f"Searching for items in category: {category}",
        "limit": limit
    }

def main():
    print("Starting server at http://127.0.0.1:9000")
    print("API docs:       http://127.0.0.1:9000/docs")
    print("Press Ctrl+C to stop.\n")
    uvicorn.run(app, host="127.0.0.1", port=9000)

if __name__ == "__main__":
    main()