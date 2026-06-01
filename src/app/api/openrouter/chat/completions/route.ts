import { NextResponse } from 'next/server';

const BASE_URL = (process.env.OPENROUTER_BASE_URL || process.env.NEXT_PUBLIC_OPENROUTER_BASE_URL || 'https://openrouter.ai/api/v1').replace(/\/$/, '');

export async function POST(request: Request) {
  try {
    const apiKey = process.env.OPENROUTER_API_KEY;
    if (!apiKey) {
      return NextResponse.json({ error: 'OpenRouter API key is missing on the server' }, { status: 500 });
    }

    const body = await request.text();
    const response = await fetch(`${BASE_URL}/chat/completions`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${apiKey}`,
        'HTTP-Referer': process.env.NEXT_PUBLIC_SITE_URL || request.headers.get('origin') || 'http://localhost:3000',
        'X-Title': 'Lohia College AI'
      },
      body
    });

    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: {
        'Content-Type': response.headers.get('Content-Type') || 'application/json'
      }
    });
  } catch (error: any) {
    return NextResponse.json({ error: error?.message || 'OpenRouter proxy failed' }, { status: 500 });
  }
}
