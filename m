Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2F01F8AD5
	for <brcm80211@lists.linux.dev>; Tue, 17 Dec 2024 18:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734461686; cv=none; b=rSCxClTCnTVYajhCkmTA5yF4yEEJY2TGwiUyS1omXznhRLe7qBIkYB540hgA5UoN5syGjT00XzPf6iEUGmYTsNlj+LGWF1Ixo/1ZZrf4+s1tEYb/ldwN6cdCKokY8ZjQbz3+m51RR4yviqE94I5Bx3579PZ3lZYcBOgzgGOo114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734461686; c=relaxed/simple;
	bh=dwEK2V+NwsxoqVLt4qwUPzJuZxjpRpVr3DgeyYIkTus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbAZ0ja/tdP+flIrBTGGNWySF0L1EHbzahnIAqnpkcJ/52/QTsY4wO8yFifSlhE+Q1+e7UWjn6JjYK29dy/wrgAvf1/6vhluV7Vf1OomiX73uFO6P1Mcn42TLsBJqJSmlIGxgw2FPeyRm7Z5rarD0IhBlZP4QOr9GZeDjYypVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPqxA2Mn; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPqxA2Mn"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29f7c3bcf45so3000614fac.1
        for <brcm80211@lists.linux.dev>; Tue, 17 Dec 2024 10:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734461684; x=1735066484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwEK2V+NwsxoqVLt4qwUPzJuZxjpRpVr3DgeyYIkTus=;
        b=dPqxA2MnUDu8W1UhbVKyIBEMwKbK4ND3Jp4IN5XPmXRa/dihYOR9N7JL/jpI0BNtDg
         FOn4BEmEEY/7XtC5wk7VUFAFQzqV57sA9aAEPCk4r0+LMq3+IPA8qhgMzjPWgDVkpXME
         vtxNKVTNHZnGxuORdelna53yd8LKhZ+iE0tpudw+K78pj0wTDlQUjh2pZX+dQv6f7utx
         v9ERadoGmGQjRKpc9BjAkXdR9C6tV8HmOAclRgvVcnESh2e5wFIWzy1eaad7XFccBOwk
         CSwEsjVXITPhqTL5a2WiGeWEcY51jLJZroThY7mPV6BmB+Eh7DzLM2U0WNRBXM/Pidnv
         uJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734461684; x=1735066484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwEK2V+NwsxoqVLt4qwUPzJuZxjpRpVr3DgeyYIkTus=;
        b=CqaE8eksQtK6ESJ9xnDtQa9SRRtgHjxlDMBJ959wv/O7JNrymcWoyyDq/XKmFLTIhe
         +QwtZZl9FX1M4oJ1DaGIZp5NAnKsOOCIzQpgM7wb4RPHUSyWtZoCk7qkX0sJMA9c3a4N
         YD/CEJ5BAP29NUTCSk26pi0D8gIKSNFHdsGfFaUhvzuiZtcr02yLLPl12Q2z614ia3PX
         N3Q2KRtprgp/blz0XKTxcGWYKt99TkpkN+/YyxM9LohMHd5vVM1/dWLtFkwCSmfwQxEs
         F9P2GYS9I/DCdPUMeon7jObzKaACcdCHuvnPGcs0E0uZU/nmShW0yeDL4QGPgZOo28bB
         1Olg==
X-Forwarded-Encrypted: i=1; AJvYcCWeS7xWCsVgbB6rZxBMAIHhH83QxKh0HMCi/3bFbYb54EIgZ+6Sv1Qp8VXg7axH161veWp478UAuIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlpREpGsc61uZa75chEP/0muSQs2Cs3B+knCoLCr44zdJkxgnu
	bvN81wsJd4KSGYEaK9BMAhVfOpW4POll01KvRxuatR3cOQMQ+tAU8qdPhrSK74mCrec6by57UuC
	ksnqptQqH5dp92PZ5c0LpJJ1FwEs=
X-Gm-Gg: ASbGncunKCHHedsnwHOzUxSzUQjUqZ5riQ9k+mRmHH1DXtdd8pDUotmmxyIbs1xutnJ
	o85XHcsczQXF9cF0RYCzDtxKtSxJZXu8nmVEg
X-Google-Smtp-Source: AGHT+IGQDZLl7mfjaTH/5VIvgXt+Gr4zkRvh4UK8kHCuvd+Y3fLIH5he4Q8ShGTMod9GEHUuUogqecqkAtumrAGeHtE=
X-Received: by 2002:a05:6870:808a:b0:29e:6211:1262 with SMTP id
 586e51a60fabf-2a3abeeb4c0mr10681465fac.0.1734461684277; Tue, 17 Dec 2024
 10:54:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122210346.2848578-1-alexthreed@gmail.com> <980c5cee-2dc3-4d26-b749-6ba00b9c2091@broadcom.com>
In-Reply-To: <980c5cee-2dc3-4d26-b749-6ba00b9c2091@broadcom.com>
From: Alex Shumsky <alexthreed@gmail.com>
Date: Tue, 17 Dec 2024 21:54:32 +0300
Message-ID: <CAF4oh-Pbbu-LJ22yyx95Zrw0rgwRHo_tEqhCnrRHRBHqADS8CA@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: fix RSSI report in AP mode
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Alexey Berezhok <a@bayrepo.ru>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Kalle Valo <kvalo@kernel.org>, 
	Kees Cook <kees@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 2:13=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 11/22/2024 10:03 PM, Alex Shumsky wrote:
> > After commit 9a1590934d9a ("brcmfmac: correctly report average RSSI in
> > station info") it is required from firmware to provide rx_lastpkt_rssi.
> > If this field is not provided brcmfmac doesn't report any RSSI at all.
> > Unfortunately some firmwares doesn't provide it. One example is firmwar=
e
> > for BCM43455 found in Raspbberry Pi.
> > See https://github.com/raspberrypi/linux/issues/4574
> >
> > Fix it by falling back to rssi field if rx_lastpkt_rssi is not provided
> > (like it was before 9a1590934d9a).
>
> Sounds like a reasonable approach. However, I would like to learn more
> about the issue. Maybe it is a per-vendor issue so I am interested what
> the sta_info version is that we get from firmware. It is printed in
> brcmf_cfg80211_get_station() with brcmf_dbg(). You can make it a
> bphy_err() call instead or enable TRACE level debug messages in the drive=
r.
>
> Also would be good to know the firmware version and kernel version of
> the BCM43455.
>
> Regards,
> Arend

Hi Arend,

Is the info I have provided sufficient?
