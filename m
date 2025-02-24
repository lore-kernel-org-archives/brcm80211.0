Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E187DA7F
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740410839; cv=none; b=R7JgnvHBdS/pYviVJEeaz8oc6WGTbryTbfPUSHD+JWQFuUuV29jjne0CE/aOrEpDHa665Wmt7r82bURNV5/UK2Le24TUOJmwfpuquOm3ci1gQ9Umnjs0Mlt3ZHd9ww4BrXbKXXGKZEfAbJClAVqftJghFG8J2vX67iP/MXxFBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740410839; c=relaxed/simple;
	bh=rhmDr4HJgDLSEVXyelVTEjpXOHwjjqq78Ihle3V/xZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTn6RQQ1ZQkV0FPIc/cBFV5wESCoRHloDg5oEgRwpIHaclkdJNyWX8DeXRUj4Tnbmv94WS5iLZE6x2acNc+FmXwe4TAHtqEG5yRGG2VYut26SZO2YI1P2KwSra6wnVWUTXblSc5Iv82s4iFn58YguMju426DTmEfIEwRIojVwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exY2kLyc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exY2kLyc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c665ef4cso78434625ad.3
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740410836; x=1741015636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVMni6CCCY2us6Xo8mKZ2xt3KdSK/Spp1dIxAZpVn4s=;
        b=exY2kLycPVoTh0IxbPHUgdCJ5XeLkuzd3tAWCn6J+8aDI2ONFR8jxkIyBRRcaeWR/F
         PVUH0V/MkQTmwGIuFS1X3JbqZj4F+chISGonpIyfnOrogHp9rl8YMHXaMFc6OaCs6Xhz
         tefnHbH0p4E6lRkSqbIe79PBSrItiZWBZ1+AVo9BjcocuViL30l4e6TXKDouQUuS8cwR
         11cYd5Atf7mRUEUNX8RwalhaA5jMlHtz27ZoFgkD4Hfd05MFkyNXFCGZsV4jtt+WBTuP
         jZ5QF6gp0Oa/HQBazivufiZteXLrIdpvR6OlwtnuOB8hrqXa3meD/ogrMuIVvRbg3eZz
         Vcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740410836; x=1741015636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVMni6CCCY2us6Xo8mKZ2xt3KdSK/Spp1dIxAZpVn4s=;
        b=eh6rmEeeq1rENZYzOJySPICC1q+PKcA2JmFXDStdb7JnypyOSEKxMj5SShDExE7uG5
         a5pgVbZ7Pz3rQtnujz5NnHR+6hJc1/gYhecsCc/K8TEJaWnlA0LRbLRB18Q0Iix5QFwh
         W2HWd5fNbCSZPa6FWRWNDwalQLVvqHf5POU3GiSLFKHkwr7zG/ohGALGMP018PGbj+wH
         WPUdzHg98OvXmfbsMtyI4h3aKTjD0JPETpiIHyUhUKB55OZp4dTEtgf+2dUPZfe+EB5r
         SthMWY7tEJ/Pv++VMGiXYLs4iTau4SJtssxxPsFhGbSu5DAXqUAcp2XIKG3gffLFGazd
         /W9g==
X-Forwarded-Encrypted: i=1; AJvYcCUAtyFVT//JuFaivZbIT+gQH1N1rVvcjyRCanUWMNnwG0JhP3pDfqaOaoqJRUFUN040R0El6WZQ/uU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWXa+fnEBQenkpqHMSjkeg7M7xZ8zoyw+hhz7u5KsyqIUAsBtQ
	n9nKqEsF8Y856D0punXaziqX8wKEY7z93sMCD3X8FI7SuJuE0qUN
X-Gm-Gg: ASbGncs5Cuh6LJuZodEU0WoWQ/b9P5+eAXcWaILq1CueEPrRj9JZivWsT1EAG9JyqvD
	eqtuwOdt2vVCCWaYOqdSGosZqYw9qV64mq+ZsH7qNZ++XCVvHRCEn8pN0g8PWOOh61B0zWUpo6U
	JPORHuVPspP0Qkkx687GSXvuUp9Etjv0ZojCmOpRkyh9UEgSPCLARnSv5cv96ScmLc3EHUxTc7X
	1nRpOH6aJzWXtFEFlWy0iuf8TKiByLQ4peeH3fN3E4cu8vtgt2pY1l4Qe9p9GAbJvpU4m8RmnIj
	UyrRK/BDHSwi2FQ4naWMWs0slBa5
X-Google-Smtp-Source: AGHT+IFl+fmLe2Snker6fx4GB6SiAhwknYLzw9iuDcRtyo7AdhlkRr95Yy6wYLAjG0rHC6oLfbqCGA==
X-Received: by 2002:a05:6a00:cce:b0:732:6214:35f5 with SMTP id d2e1a72fcca58-73426c8d21fmr17154986b3a.1.1740410835401;
        Mon, 24 Feb 2025 07:27:15 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7346d9b1af1sm1359758b3a.71.2025.02.24.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:27:14 -0800 (PST)
Date: Mon, 24 Feb 2025 23:27:01 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
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
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
Message-ID: <Z7yPxdiLLXlsWSQN@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>

On Sun, Feb 23, 2025 at 09:25:42PM +0100, Uros Bizjak wrote:
> 
> Please note that GCC (and clang) provide __builtin_parity{,l,ll}() family of
> builtin functions. Recently, I have tried to use this builtin in a couple of
> places [1], [2], but I had to retract the patches, because __builtin
> functions aren't strictly required to be inlined and can generate a library
> call [3].
> 
> As explained in [2], the compilers are able to emit optimized
> target-dependent code (also automatically using popcnt insn when avaialble),
> so ideally the generic parity64() and parity32() would be implemented using
> __builtin_parity(), where the generic library would provide a fallback
> __paritydi2() and __paritysi2() functions, otherwise provided by the
> compiler support library.
> 
> For x86, we would like to exercise the hardware parity calculation or
> optimized code sequences involving HW parity calculation, as shown in [1]
> and [2].
> 
> [1] https://lore.kernel.org/lkml/20250129205746.10963-1-ubizjak@gmail.com/
> 
> [2] https://lore.kernel.org/lkml/20250129154920.6773-2-ubizjak@gmail.com/
> 
> [3] https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com/

Hi Uros,
Thanks for your information.

We originally planned to implement hardware optimizations after this
patch series. However, for V2, We will incorporate __builtin_parity(),
while keeping our current implementation as the fallback function.

Best regards,
Yu-Chun Lin
