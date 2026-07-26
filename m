Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429D347FC8
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093910; cv=pass; b=ZmqCkcsAhRxyFl7yFGJ40+8dIPz9txTOAtHABhK/rhmIczdpfA/V8Qe5aidkJnLM4OX2gfBx//hQM15koyKGHC9Aczzu4+HsQXb0MJ04+T0Vz481Z+66ofEDKNy2dqkkRhZl+U6Eg/pYcAAwZf0iBqPxVzGGlC7QJvvEawotFrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093910; c=relaxed/simple;
	bh=xji9I5cCWfyl8rCasHuYwdrQgv7IUf2NXmLBjKTVm1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+uNNORK0sIYCI9GMNASo+5aWORf7uUQoATCKCSkUHKgaVOMiuYtOmGluJet8OpcCAncFd4gm058i7hon1fe4/oroW+hbX+SiYOepWQGhZDB5qffJ5Qen/Gxg5j7fGlcUDvGHvtYjQc6ta3Cy9utvh+7SGewz9BOLa0013HTlgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJoeCUXY; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJoeCUXY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c3044e4b2so311768a12.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785093907; cv=none;
        d=google.com; s=arc-20260327;
        b=Kz7dB2ifmEVXpVYorsDXGA1kM0ZBHJ/+AFZIH+QfbCsaZ8bKB+y6+J6YWZx4BNpLkJ
         PzGMDJAQ339Nhasqk8n8fbmLhUOL2UVgEZzTm0FViMVU+biQyV5SBx9WfGBToK2i/X31
         dF/UyWDJip4a3y+VbP+yKUrhhSE+wsi/uU32rr2AhVfKaOZkEMgdNpwjHE3uSYJhGU7g
         4R+3tIalsc/bjdtsIxdEly2msl9lv5a4oYAcYmSNj3UQ8nreYvmQbf4t4i/UdJTOMrFd
         ClRDgm3G9OTrinAUb64uAZqV5f45kmsDxPBZLRldIEwQqXLIKbsJ3pD5c7Gw8xJef4j/
         zNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xji9I5cCWfyl8rCasHuYwdrQgv7IUf2NXmLBjKTVm1M=;
        fh=dcHd+rgENWovbPLiW8Bx+5uOmFq1y1rFMg3gptCX0vo=;
        b=ewlIonlB4arz2tb+QSfp+RWR1nxdgLooKGQFN3naH2MKWyaKU6iwBrVlxZn3YxjUQL
         8NchsddTd/vZMwQm1Z9n9bN9wbFVnvC1p4jytOq10l2dGqLSXi/aqBh8KVZRdvsRxuQO
         54eiekummpel2ie01S2YqHiehLLUIh4YvgP/ifL9oilxOwvT/yo50OclwtnZEp2vp/Pu
         iTvkM6ASYFsPSeAxlCSi4aRBE1Na/1dtMd8Da+e6c1I1/sIyPsnk+XD7t2pFYXqXv0me
         pdM8XBrL4yR2pgn5DMtkFdNwYwMFaJLOw4B+EPPLkKBhLiZxdMhmC9l8IB1GZ6r4crkQ
         WHqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785093907; x=1785698707; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xji9I5cCWfyl8rCasHuYwdrQgv7IUf2NXmLBjKTVm1M=;
        b=pJoeCUXYZzfBMotwzELaJ/jvXMcxh08NuO76D8ZqnTKce6EFwJGM4bY1Xt/f701BOW
         xTQRbodFVHTfCr2rY3W7NBW9ZeFl4fg8XPsZX7DHtBCxiwowQjEU/J3KI0e01T1frTo/
         xw6b1pM+3KIr0KOr+pjsuLNbOeWZnZla7RU6SBxuLqg0LsGuuqX2aPSEMMvZ4P1SJZsh
         Dr+kLXINghHQAkzQCF6PF26T4qo8fWUnZ/b2xpXqtwmh5cwwiVhWdMKPRlT4LXv4Ugfi
         EJGfZExBuc2EYpIWZZF7K+OEwFCdXveN7MF6zC7DZN6h/yP/jBkiVzGF/Cj3yB24tRjX
         PMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093907; x=1785698707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xji9I5cCWfyl8rCasHuYwdrQgv7IUf2NXmLBjKTVm1M=;
        b=XoVmgKxmbUSQ+f+nVwM9n7j6ncM/x7K70X8d6jZAj/Ki62IQ4rrEVKHO7buSib4n8X
         T1Gu9AnSuoTr1atrnxrPNwi5lSM8OfzuN0CDiK91csEOl/Z80j7kiHSMvm5KjQiaVt0A
         lY/ixxxptCZiVE5p4GsZ8d5G1WaQyQF6Wq33p5YrGWg/rNwOqmvtTbMerI5OI8SmKFm8
         YlIz+Vsye/WXUMVdI/qw5x7/Mn6YFIYd9x6T4vqwMrdEnJHVmefK1DhVacq++7jtgezQ
         6Gn55z8KMUegjcHe+RayZnsDxyB4UUVpW4wGC9wfQy8PcGty1Qk6j2GoOnM3VXLwzMGA
         dtPg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6F2eymWgsv2SBafHLzBipwoDBXpk1IASBj2U4KyHZM4cpj0UZonLBJks0leimUMlaJhMv8+SKTFQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYrpoPhVq+rf+wtWyZNletRJIpKLGA1puI5XJ7didGdhJgSiTO
	SuXeJ+kovagECJIZunWiy93+hLT0F+qfJbsx7nz3KPYoYWE/0WlPKWKTqyb2Xfzm5c3ZgHkjKT6
	fYduRGcKCBRoBBbhEXF4t42eAhMzpt8Q=
X-Gm-Gg: AR+sD13AyJgNrS9tJpdd5Q+9x7bYs5Cux6v79oEGu6L3QNxkZBkhzIJbgeNWuzrPDUg
	mdUrdfqEGu32GhVCqHiDgb8sZauKduP8vc6WZcU11TntPmhNj1X4gc54VtvW5Fp/rC4MX+2Bv/d
	9CdiFlrvCFokfbsVmGDHpL9NHBgDrHwIne5h+7WTcatob6OWWnt4VDjVul6k8cH2xYDMwhD5ZKN
	DTPjTcl6dz8PuU41cDHCOOhHbLIfmVmXvWbmfkEdY5lSmkODgASryd2TZ6sJnQtY++V32jzMYHg
	TOZe3bqrAStXk2UZHGLpDMdc+0zhVKWML3UnoXmfqkJHczXDi7RqqJnyO15I
X-Received: by 2002:a05:6402:234f:b0:698:81d7:b812 with SMTP id
 4fb4d7f45d1cf-69fc1160318mr1453646a12.3.1785093906641; Sun, 26 Jul 2026
 12:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260725014411.170340-1-bogdan.nicolae@gmail.com> <9ca181db-7bec-4f6c-9f42-4a66068af354@broadcom.com>
In-Reply-To: <9ca181db-7bec-4f6c-9f42-4a66068af354@broadcom.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Sun, 26 Jul 2026 14:21:17 -0500
X-Gm-Features: AUfX_mwNTwsOkY6qJ2cpR267Dt0F7D36P3SV6wvBKNyBko86SLQ_6Ni4ThCqsqM
Message-ID: <CA+ORkNTq5Wn079=D_W6J+k1kbJtL+A1mfDU1furVsB9j=sa_qg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: cyw: set a unique cookie for mgmt tx
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, it sounds good. Thanks Arend.

Bogdan

On Sun, Jul 26, 2026 at 2:21=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 25/07/2026 03:44, Bogdan Nicolae wrote:
> > Set cookie using an increasing atomic counter. Avoids mismatches of com=
pletion
> > events later in brcmf_notify_mgmt_tx_status, where packet_id !=3D vif->=
mgmt_tx_id
> > is checked.
>
> Thanks for the split. I increased the scope and been looking in the
> cookie usage in the wireless subsystem. So I have a series lined up to
> change the cookie to an input parameter and have cfg80211 hand out the
> cookie value (it already has cfg80211_assign_cookie() function). This
> will also cover zero cookie fix here. So I would suggest to drop this
> patch and only let the PMKID patch go in.
>
> Regards,
> Arend
