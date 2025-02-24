Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1A1C84AF
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740434901; cv=none; b=HEUbvJU5fA93mqE52QV7Y1aomKX7U5oYYQP357Gf7uZ95gt4iwl33qJaFgcvL6r6jl780SpqD8vanYMRPZjx+tiCc8inR64o5oiKfE6vG3a6iK/gxD0KQQkkuLrXGoo5jm8wzBLerqBOlBP/wZXgqmgwuntUHtJo/g13QMBdJuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740434901; c=relaxed/simple;
	bh=BiUGPgW/xQuplz2NzaQAzErLtEmTxPAlsm7wIiONLQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W68/G2t2u3DI/F8MZVEYxe+NTJNu5gKFo6avxOolLKA4UUU9AQvrwTMsWUFv4bMqF/W2vQ9i0b5qHEQYwhqg+nj6EcY6VQMNSEDns6pqS9PqlyaPa2lVRwtrV2R4w1KUmBeTGLIYUgsw1gJyZNOdVhll1ynGScNbUbp0Z+2muOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwILfuAt; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwILfuAt"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a6bso51506601fa.1
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740434898; x=1741039698; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oaFYm3uznORB4542Rq36b3rymmLdKUYeu8YPMsf53M=;
        b=HwILfuAtVxzIPoQf5l2AyHJSp+XUy/qdFT2oVS4Expfmk7qMDcXU75pBrH/C0N+JV0
         QyaZdXr0mMAJReG56LQTKZ6p2mgEslfcMqwAYUv8rZCQwcPKMBswYC34i8AEKK04NpGT
         Ycxsl+L6aIqr4I0YZJP7x9pf3oYMtrbc3RcY7j9Ge4Fmhs9n6ILNV86XW9Z+3RR4A9as
         86GCud/KR5Cc/IYg543SCXq1bEAVDCA0Q6TfvLmXSNhvqJveUF9/Rk0YpgkBKOiCnNC6
         TgGBpwvysaJMQrAo73p/V8oNFqleaPjTz1EKW004MqiCYhDmtddBg1ApOPjmONFGsb48
         GBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740434898; x=1741039698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oaFYm3uznORB4542Rq36b3rymmLdKUYeu8YPMsf53M=;
        b=giyd5bDWoOhd0lvOwZb8xJBsUtgb5cqRIw02q+35XBtGWYaglRMA18+WLZy6YIyIRV
         6Lv/VNGnDtJhcMRW654x/5lvhFfOvUpmv3zUgW3UsD9lPY2fnBT1GcCY7zAc2poNvMN4
         45YVQswzRS663cUFCTCRELn+J3NHZJAJ7bCgDO46vrwJ2HavuB5hZNwMhj5koqR2feNY
         0Lpd/9ry3icpv0ofvWfePh/PURakm4lUTmeeLFV+Fi7FGrzSjIRZaZq9eNuJPJAqpDkq
         41N7CEGKc9eKAg0sqG9LHXskDSPGO7iqQ/5qFXzg0Ql/yWzRPcoFxl3AjItL+/pHHvHL
         L4/A==
X-Forwarded-Encrypted: i=1; AJvYcCWei4XyMUyk09Uyca5o3nL7yDj+on5OFDHBwt/Id8Rx0wVEU3aaKWyRR1fT6f6DZswL76eHw9BMvDs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2rYTtQUG+6br+1oL128eRnrJaGZPi9KdmJ0ahWRb28pAdTXwQ
	AU5Uk4RLtbaxgLGbaqMoMgH60UJuGuTwN/xkkC+nhZsi5iuyUqQZfEHfjBW7YnYmqZYiA4FA5u8
	mDwWPhTyg1Vanb1vV5IVX5g2Bufw=
X-Gm-Gg: ASbGncvV+q5lMD4/S1EWqPuJu8IZR9tT9WyRsZ2zET55mReRmBaPYtMVarEfTVhEr/B
	ODxD9/t52OXHY9NQtmM7QIzPRXsp4gOqXlxda6fgVFNiyLxuWMHSFbgI8sEEeRSQQ2U4poEt9m1
	x11SayzZM=
X-Google-Smtp-Source: AGHT+IHVkIuUFpCDrTU0uvA7Fgx58+MbAWd4iAmh/s9u5Z4OX/tBnfLt5fF/OB0IUp1t1TAS/xkQrlAynJ4vLhos6iA=
X-Received: by 2002:a2e:8713:0:b0:300:1ea5:1655 with SMTP id
 38308e7fff4ca-30a80c2525dmr3121091fa.15.1740434897401; Mon, 24 Feb 2025
 14:08:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com> <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 24 Feb 2025 23:08:05 +0100
X-Gm-Features: AWEUYZk0kdMcSa1NJ7f-FEs-56xLQUiW9T9ljXTGABrJPIypOLr5b30gUzs5pw0
Message-ID: <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with parity8()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, 
	Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com, 
	mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com, 
	arend.vanspriel@broadcom.com, johannes@sipsolutions.net, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com, 
	akpm@linux-foundation.org, mingo@kernel.org, alistair@popple.id.au, 
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
	Yu-Chun Lin <eleanor15x@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 10:56=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On 2/24/25 07:24, Uros Bizjak wrote:
> >
> >
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> >> Refactor parity calculations to use the standard parity8() helper. Thi=
s
> >> change eliminates redundant implementations and improves code
> >> efficiency.
> >
> > The patch improves parity assembly code in bootflag.o from:
> >
> >    58:    89 de                    mov    %ebx,%esi
> >    5a:    b9 08 00 00 00           mov    $0x8,%ecx
> >    5f:    31 d2                    xor    %edx,%edx
> >    61:    89 f0                    mov    %esi,%eax
> >    63:    89 d7                    mov    %edx,%edi
> >    65:    40 d0 ee                 shr    %sil
> >    68:    83 e0 01                 and    $0x1,%eax
> >    6b:    31 c2                    xor    %eax,%edx
> >    6d:    83 e9 01                 sub    $0x1,%ecx
> >    70:    75 ef                    jne    61 <sbf_init+0x51>
> >    72:    39 c7                    cmp    %eax,%edi
> >    74:    74 7f                    je     f5 <sbf_init+0xe5>
> >    76:
> >
> > to:
> >
> >    54:    89 d8                    mov    %ebx,%eax
> >    56:    ba 96 69 00 00           mov    $0x6996,%edx
> >    5b:    c0 e8 04                 shr    $0x4,%al
> >    5e:    31 d8                    xor    %ebx,%eax
> >    60:    83 e0 0f                 and    $0xf,%eax
> >    63:    0f a3 c2                 bt     %eax,%edx
> >    66:    73 64                    jae    cc <sbf_init+0xbc>
> >    68:
> >
> > which is faster and smaller (-10 bytes) code.
> >
>
> Of course, on x86, parity8() and parity16() can be implemented very simpl=
y:
>
> (Also, the parity functions really ought to return bool, and be flagged
> __attribute_const__.)
>
> static inline __attribute_const__ bool _arch_parity8(u8 val)
> {
>         bool parity;
>         asm("and %0,%0" : "=3D@ccnp" (parity) : "q" (val));

asm("test %0,%0" : "=3D@ccnp" (parity) : "q" (val));

because we are interested only in flags.

Uros.
