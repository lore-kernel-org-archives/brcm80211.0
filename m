Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C621D58F
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362917; cv=none; b=ChAecSfvUL4VYzqm4x8IGSIMwCGFd5edex97Vdji2QSvvyqIB0SoZAkXxh01NKcnb7Ye5b5YWI5RQEme6vfcQV42MAy2/T2WPnW+pd8dvTLNnnA4zdyuUkmAJnbC5tyKoUKXMxgxSaCXnPPjS6AZ+k2gVnD8X60KwAZDoq3fVxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362917; c=relaxed/simple;
	bh=tzrS+lI9W7w2w8k6AVE6C+sBU6gvdTLX5BacFbhKkPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFS0s25W/Kegb1/hJwypJrcXJNHcTxSBVBoCwOnZZPeLt3UG8F53m0sf23YMlcoVNGBrKXlcE/AXdXHkoZJnIykVvEMh17Iz12rlBqoXap4Xf9p2jTvCpIbCWiuVEzYTRnraziKtlmNOqKUM9UgpqTUK4GQvYdU3tMREvs9uTuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyikLxfo; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyikLxfo"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so1522273276.0
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 07:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741362914; x=1741967714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=;
        b=NyikLxfotK2bmFDo3S36s/mc3NXsXr6nTdOYK1sSzujMA6wpezRijCp5B+3ZVlebj7
         PoOSPJ5ihxuhRL1WalKkifFZR3mTiV4LzCZkKhB67T1w25ZDS8jfzmjJ/b/Q28XSuSxh
         +ge4Od+R/JzOkqVZauNgIpXrHo7DK1c6j3Dpu7Hm9FCEG+vghgujueCNrkUJ7chOlc5d
         x55cVAT6OuRXnf/Di/yfz5vzrxpOmj5B+uevc0mJYJrwa8+6HC7ifOpUuVlYITURaYhc
         qfSEgwi2hOGRmkFQUSpq/3ehWbiOZ23NXzTtNVZpCQbMIJJXz6K/dkt2I570G9bmnU7D
         WoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362914; x=1741967714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=;
        b=DXMGRj8s+b+DBuOcZquGX+uddQFCUwFFYUTrtuD392oQ81lURhPEsm0lmrpfqP62G4
         uthiywf0ePkfxdyMzc6N4r/lD7Hxi3qY8WfxR69SsvlDzms86yPhuHd5vQAkJr17Wcmp
         dsupqbAEpJAiyjW4B8c/8j2uMzXjg0D74lFBaAE3Kb7PBdLW6PCoereOft9LYt7dJ6cx
         r2KeCzqZU8AeE2RYyjdu98+X8lg8rbvLja69RsfTHNWqaL8SwSax/VHOYMEWziaV9c6q
         RwPU09mnR5hlfMoW321pwc6jeuEEhYct2xSKUinjPgmjrE/sEoDI7pn7huNJTaCLrYwQ
         2wOw==
X-Forwarded-Encrypted: i=1; AJvYcCVI3s9UHH6TJFqjmW6/MXP+VEe2fzk7dgkJMbeZljYXK/s4xLPjHcd7Xp6ApfDkrMsSs2u85jFYNwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNDq42AL/hrq/WS3nAzV6HHWH1DbWhSBqZHEu2cs5UVp7UzvsK
	MjPeDUFGrEG3NwD6EzNjRcM8bw870ytARRMsVmjQtVs1KN4W5a2E
X-Gm-Gg: ASbGncv8qWY/mX2Ip7YdobaDR+r7GbXe0f5KAIMw0KV/QqityryuxAlofcFRnI+NVG+
	r78jQC7V4V+LGdncv1FCfM8/wsHUxVDat4IfX2HZ3/xswB/KrmZgiIdhn9CRLY7ILtsKeU7jxYt
	Bt2kvXzdXBSHrO0LX7iyOpSqGAvtNlqhUn8poiYu25F6lqVoKgpfsK00l0dGHjYQtAXX2/ol9al
	LXWUCXj8B3s8uwYux3Sk+3J/1t+reZu8exgoAcWv9q4tngfvb6cu4UYuo2JWGpHNXUPguayBo84
	yBZiD0Oy73w8SBkZoMx2uRyBAr3rSd3N+za+bqB2KDT90c1nbKf+7RHP+E8wo+oDlgFaAqSfQW3
	H7ZfB
X-Google-Smtp-Source: AGHT+IGXsVm03RpeRs7naE92Mk1v2+BdYsqkQh0ckjckzDu/bnevFLrinU7kQnO5Z9/M1SdGBh4guA==
X-Received: by 2002:a05:6902:2292:b0:e60:c79f:6f6c with SMTP id 3f1490d57ef6-e635c0f80admr4791285276.8.1741362914172;
        Fri, 07 Mar 2025 07:55:14 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e635e4c8f69sm386658276.42.2025.03.07.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:55:13 -0800 (PST)
Date: Fri, 7 Mar 2025 10:55:13 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8sW4c5LxV-ITdCi@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>

On Fri, Mar 07, 2025 at 07:57:48AM +0100, Jiri Slaby wrote:
> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > Several parts of the kernel contain redundant implementations of parity
> > calculations for 16/32/64-bit values. Introduces generic
> > parity16/32/64() helpers in bitops.h, providing a standardized
> > and optimized implementation.
> > 
> > Subsequent patches refactor various kernel components to replace
> > open-coded parity calculations with the new helpers, reducing code
> > duplication and improving maintainability.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > In v3, I use parityXX() instead of the parity() macro since the
> > parity() macro may generate suboptimal code and requires special hacks
> > to make GCC happy. If anyone still prefers a single parity() macro,
> > please let me know.
> 
> What is suboptimal and where exactly it matters? Have you actually measured
> it?

I asked exactly this question at least 3 times, and have never
received perf tests or asm listings - nothing. I've never received
any comments from driver maintainers about how performance of the
parity() is important for them, as well.

With the absence of _any_ feedback, I'm not going to take this series,
of course, for the reason: overengineering.

With that said, the simplest way would be replacing parity8(u8) with
parity(u64) 'one size fits all' thing. I even made a one extra step,
suggesting a macro that would generate a better code for smaller types
with almost no extra maintenance burden. This is another acceptable
option to me.

Thanks,
Yury
