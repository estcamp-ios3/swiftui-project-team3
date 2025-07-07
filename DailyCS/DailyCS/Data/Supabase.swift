//
//  Supabase.swift
//  DailyCS
//
//  Created by 최용헌 on 7/6/25.
//

import Foundation

import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://mvdnxggkvttzalkphiga.supabase.co")!,
  supabaseKey: Bundle.main.infoDictionary?["SUPABASE_KEY"] as? String ?? ""
)
