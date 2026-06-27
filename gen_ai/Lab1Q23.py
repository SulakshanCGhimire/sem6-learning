# 23. Write a program to create a FastAPI endpoint that returns student details using path parameters. 

from fastapi import FastAPI
import uvicorn

app = FastAPI(title="Lab 1 - Question 23")

# Simulated student database
students = {
    1: {"name": "Sulakshan", "age": 19, "marks": 85},
    2: {"name": "Susan", "age": 20, "marks": 88},
    3: {"name": "Subikhyat", "age": 21, "marks": 86}
}

@app.get("/students/{student_id}")
def get_student(student_id: int):
    student = students.get(student_id)
    if student:
        return student
    return {"message": f"Student with ID {student_id} does not exist in our database."}

def main():
    print("Starting server at http://127.0.0.1:9000")
    print("API docs:       http://127.0.0.1:9000/docs")
    print("Press Ctrl+C to stop.\n")
    uvicorn.run(app, host="127.0.0.1", port=9000)

if __name__ == "__main__":
    main()