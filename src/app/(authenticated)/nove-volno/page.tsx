"use client";

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";
import { format } from "date-fns";
import {
  Calendar,
  MessageSquare,
  ArrowLeft,
  CheckCircle,
  Tag,
} from "lucide-react";
import Link from "next/link";
import type { TypVolna } from "@/lib/types/database";
import { typVolnaLabels } from "@/lib/types/database";
import { DatePicker } from "@/components/ui/DatePicker";

export default function NoveVolnoPage() {
  const [datumOd, setDatumOd] = useState(format(new Date(), "yyyy-MM-dd"));
  const [datumDo, setDatumDo] = useState(format(new Date(), "yyyy-MM-dd"));
  const [typ, setTyp] = useState<TypVolna>("dovolenka");
  const [dovod, setDovod] = useState("");
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState("");
  const router = useRouter();
  const supabase = createClient();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError("");

    if (datumDo < datumOd) {
      setError('Dátum "do" nemôže byť pred dátumom "od"');
      setLoading(false);
      return;
    }

    const {
      data: { user },
    } = await supabase.auth.getUser();
    if (!user) {
      setError("Nie ste prihlásený");
      setLoading(false);
      return;
    }

    const { error: insertError } = await supabase.from("volna").insert({
      reporter_id: user.id,
      datum_od: datumOd,
      datum_do: datumDo,
      typ,
      dovod: dovod || null,
      stav: "caka",
    } as any);

    if (insertError) {
      setError("Nepodarilo sa pridať voľno. Skúste znova.");
      setLoading(false);
    } else {
      setSuccess(true);
      setLoading(false);
    }
  };

  if (success) {
    return (
      <div className="max-w-lg mx-auto">
        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-8 text-center">
          <div className="flex justify-center mb-4">
            <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center">
              <CheckCircle className="w-8 h-8 text-green-600" />
            </div>
          </div>
          <h2 className="text-xl font-semibold text-gray-900 mb-2">
            Voľno pridané!
          </h2>
          <p className="text-gray-500 mb-6">Vaše voľno čaká na schválenie.</p>
          <div className="flex gap-3">
            <button
              onClick={() => {
                setSuccess(false);
                setDovod("");
                setTyp("dovolenka");
              }}
              className="flex-1 px-4 py-2.5 border border-gray-200 rounded-xl text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
            >
              Pridať ďalšie
            </button>
            <Link
              href="/volna"
              className="flex-1 px-4 py-2.5 bg-blue-600 rounded-xl text-sm font-medium text-white hover:bg-blue-700 transition-colors text-center"
            >
              Zobraziť voľná
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-lg mx-auto">
      <div className="mb-6">
        <Link
          href="/domov"
          className="inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-700"
        >
          <ArrowLeft className="w-4 h-4" />
          Späť na domov
        </Link>
        <h1 className="text-2xl font-bold text-gray-900 mt-2">Nové voľno</h1>
        <p className="text-sm text-gray-500 mt-1">
          Zadajte dátumy a typ vášho voľna
        </p>
      </div>

      {error && (
        <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mb-6 text-sm">
          {error}
        </div>
      )}

      <form
        onSubmit={handleSubmit}
        className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 space-y-5"
      >
        {/* Typ voľna */}
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">
            <div className="flex items-center gap-1.5">
              <Tag className="w-4 h-4 text-gray-400" />
              Typ voľna
            </div>
          </label>
          <select
            value={typ}
            onChange={(e) => setTyp(e.target.value as TypVolna)}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all text-gray-900"
          >
            {(Object.keys(typVolnaLabels) as TypVolna[]).map((key) => (
              <option key={key} value={key}>
                {typVolnaLabels[key]}
              </option>
            ))}
          </select>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <DatePicker
            value={datumOd}
            onChange={(v) => {
              setDatumOd(v);
              if (v > datumDo) setDatumDo(v);
            }}
            label="Od"
          />
          <DatePicker value={datumDo} onChange={setDatumDo} label="Do" />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">
            <div className="flex items-center gap-1.5">
              <MessageSquare className="w-4 h-4 text-gray-400" />
              Dôvod (voliteľné)
            </div>
          </label>
          <textarea
            value={dovod}
            onChange={(e) => setDovod(e.target.value)}
            className="w-full px-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition-all text-gray-900 placeholder-gray-400 resize-none"
            rows={3}
            placeholder="Dôvod voľna..."
          />
        </div>

        <button
          type="submit"
          disabled={loading}
          className="w-full bg-blue-600 text-white py-3 rounded-xl font-medium hover:bg-blue-700 focus:ring-4 focus:ring-blue-200 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {loading ? "Pridávam..." : "Pridať voľno"}
        </button>
      </form>
    </div>
  );
}
