"use client";

import { useState, useEffect, useMemo } from "react";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";
import { Lock, Eye, EyeOff, CheckCircle, XCircle } from "lucide-react";
import Link from "next/link";
import type { AuthChangeEvent, Session } from "@supabase/supabase-js";

export default function ObnovitHesloPage() {
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState("");
  // null = still waiting, true = ready, false = link invalid/expired
  const [sessionReady, setSessionReady] = useState<boolean | null>(null);
  const router = useRouter();
  const supabase = useMemo(() => createClient(), []);

  useEffect(() => {
    // First: check the URL hash for an error from Supabase (e.g. expired OTP)
    const hash = window.location.hash.slice(1);
    const params = new URLSearchParams(hash);
    const hashError = params.get("error_code") ?? params.get("error");
    if (hashError) {
      setSessionReady(false);
      return;
    }

    // Listen for PASSWORD_RECOVERY event fired when Supabase exchanges the hash token
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event: AuthChangeEvent) => {
      if (event === "PASSWORD_RECOVERY" || event === "SIGNED_IN") {
        setSessionReady(true);
      }
    });

    // Also catch an already-active session (e.g. PKCE exchanged by middleware)
    supabase.auth
      .getSession()
      .then(({ data: { session } }: { data: { session: Session | null } }) => {
        if (session) setSessionReady(true);
      });

    // If nothing fires after 10 s the link is likely invalid
    const timer = setTimeout(() => {
      setSessionReady((prev) => (prev === null ? false : prev));
    }, 10_000);

    return () => {
      subscription.unsubscribe();
      clearTimeout(timer);
    };
  }, [supabase]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");

    if (password.length < 6) {
      setError("Heslo musí mať aspoň 6 znakov");
      return;
    }
    if (password !== confirmPassword) {
      setError("Heslá sa nezhodujú");
      return;
    }

    setLoading(true);

    const { error: updateError } = await supabase.auth.updateUser({ password });

    if (updateError) {
      setError(
        "Nepodarilo sa zmeniť heslo. Odkaz mohol vypršať, požiadajte o nový.",
      );
      setLoading(false);
    } else {
      setSuccess(true);
      setTimeout(() => router.push("/domov"), 2500);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-linear-to-br from-blue-50 to-slate-100 px-4">
      <div className="w-full max-w-md">
        <div className="bg-white rounded-2xl shadow-xl p-8 pt-12">
          {/* Logo */}
          <div className="flex flex-col items-center mb-8">
            <img
              src="/logo.png"
              alt="Logo"
              className="w-18 mr-4 flex items-center justify-center mb-4"
            />
            <h1 className="text-2xl font-bold text-gray-900">Nové heslo</h1>
            <p className="text-gray-500 mt-1 text-center text-sm">
              Zadajte nové heslo pre váš účet
            </p>
          </div>

          {success ? (
            <div className="text-center">
              <div className="flex justify-center mb-4">
                <CheckCircle className="w-16 h-16 text-green-500" />
              </div>
              <h2 className="text-lg font-semibold text-gray-900 mb-2">
                Heslo bolo zmenené!
              </h2>
              <p className="text-gray-500 text-sm">
                Presmerovávam vás na domovskú stránku…
              </p>
            </div>
          ) : sessionReady === false ? (
            <div className="text-center">
              <div className="flex justify-center mb-4">
                <XCircle className="w-16 h-16 text-red-500" />
              </div>
              <h2 className="text-lg font-semibold text-gray-900 mb-2">
                Odkaz je neplatný alebo vypršal
              </h2>
              <p className="text-gray-500 text-sm mb-6">
                Platnosť odkazu na obnovu hesla je 1 hodina. Požiadajte o nový
                odkaz.
              </p>
              <Link
                href="/login"
                className="inline-block bg-blue-600 text-white px-6 py-2.5 rounded-xl font-medium hover:bg-blue-700 transition-colors text-sm"
              >
                Späť na prihlásenie
              </Link>
            </div>
          ) : sessionReady === null ? (
            <div className="text-center py-8">
              <div className="w-8 h-8 border-2 border-blue-600 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
              <p className="text-gray-500 text-sm">Overujem odkaz…</p>
            </div>
          ) : (
            <>
              {error && (
                <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mb-6 text-sm">
                  {error}
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-5">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">
                    Nové heslo
                  </label>
                  <div className="relative">
                    <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                    <input
                      type={showPassword ? "text" : "password"}
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      className="w-full pl-10 pr-12 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all text-gray-900 placeholder-gray-400"
                      placeholder="Minimálne 6 znakov"
                      required
                      autoFocus
                    />
                    <button
                      type="button"
                      onClick={() => setShowPassword((v) => !v)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                    >
                      {showPassword ? (
                        <EyeOff className="w-5 h-5" />
                      ) : (
                        <Eye className="w-5 h-5" />
                      )}
                    </button>
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1.5">
                    Potvrdiť heslo
                  </label>
                  <div className="relative">
                    <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                    <input
                      type={showConfirm ? "text" : "password"}
                      value={confirmPassword}
                      onChange={(e) => setConfirmPassword(e.target.value)}
                      className="w-full pl-10 pr-12 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all text-gray-900 placeholder-gray-400"
                      placeholder="Zopakujte heslo"
                      required
                    />
                    <button
                      type="button"
                      onClick={() => setShowConfirm((v) => !v)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                    >
                      {showConfirm ? (
                        <EyeOff className="w-5 h-5" />
                      ) : (
                        <Eye className="w-5 h-5" />
                      )}
                    </button>
                  </div>
                </div>

                <button
                  type="submit"
                  disabled={loading}
                  className="w-full bg-blue-600 text-white py-3 rounded-xl font-medium hover:bg-blue-700 focus:ring-4 focus:ring-blue-200 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? "Ukladám…" : "Nastaviť nové heslo"}
                </button>
              </form>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
