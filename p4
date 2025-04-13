import requests
import openai
from supabase import create_client

def handler(request):
    API_KEY = "YOUR_GOOGLE_API_KEY"
    LOCATION = "29.7604,-95.3698"
    RADIUS = 5000
    KEYWORD = "AT&T Fiber Internet"
    
    # Fetch leads
    leads = fetch_places_data(API_KEY, LOCATION, RADIUS, KEYWORD)
    
    # Process leads with OpenAI
    for lead in leads:
        lead['enhanced_info'] = process_lead_with_openai(lead)
    
    # Save leads to Supabase
    for lead in leads:
        save_lead_to_supabase(lead)
    
    return {"statusCode": 200, "body": "Leads generated and saved successfully"}
