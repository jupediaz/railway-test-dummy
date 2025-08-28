from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Clinic Cloud API - Test",
    description="Hair transplant clinic management SaaS API - Test Environment",
    version="1.0.0",
)

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins for development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {
        "message": "Clinic Cloud API - Test Environment",
        "version": "1.0.0",
        "status": "healthy",
        "environment": "test"
    }

@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "api"}

@app.get("/api/v1/me")
async def get_me():
    return {
        "id": "test-user",
        "email": "test@clinica.com",
        "role": "doctor"
    }

@app.get("/api/v1/patients")
async def list_patients():
    return [
        {
            "id": "1",
            "code": "P001",
            "first_name": "Juan",
            "last_name": "Pérez",
            "sex": "male",
            "is_active": True,
            "created_at": "2024-01-15T10:00:00Z"
        },
        {
            "id": "2", 
            "code": "P002",
            "first_name": "María",
            "last_name": "González",
            "sex": "female",
            "is_active": True,
            "created_at": "2024-01-20T11:00:00Z"
        }
    ]

if __name__ == "__main__":
    import uvicorn
    import os
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run("main:app", host="0.0.0.0", port=port, reload=False)