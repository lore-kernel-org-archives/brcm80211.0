Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7AC209F5C
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339341; cv=none; b=Ou8PJ/iQXt/6ftNQWq2p2hyzrhlgmdyvqquEsQca1YprfUK0gZJvYoIKcdPkz/eyYVGfmsxvF/oVMmm4/YwCd9TvECNXhrI0vMM1zUJ8L1+a1RMzrYD4cvrw9OfYZLfi1LLcaXnL9ZB1AxykzwnuvJL4Bt6nb2BATD+Ufo928yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339341; c=relaxed/simple;
	bh=puks5gz+Z0SWJNwNTjIqnOHXEonpz+7vxTX5Qf8VLug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqh3EJJT/b1D83kD4nSJEXZWRpx2ozXceOXgSRqW5IaJVB6LfjzD2u0bEZ9gCYRKqQ+mtSLciS4P+mlGEjt2BuDSEWmVltRQ+ImNHzzDFxXDvrb6fFLlj5Cw/yM1BEJ8sZEXofKFNw7zCNM9zLxquBxya46u4W4FfboniCmJOP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDeSghNZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDeSghNZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff04f36fd2so2941217a91.1
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741339339; x=1741944139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XztObitingC3692I+pBVpdt55S8NywKGMFDoLFkCI1M=;
        b=IDeSghNZvEdSzN3Sf4AtEZFuOptLPtq6hvND9zC/vJDXvtS/Xs91iEJ60Ae5BkpQl7
         uuudEEr9yDtejfajejvBweK8KhlFGxChJrjZFJ5sGEpawiMbzDjGsC4D94p+C422NK+s
         dIWD5FnKiSab04OkMFGBJ3gg4jY4xWNgIDs3Jw/1uAWTtOHNs5WKuwHIyyRuaONCTDLz
         aG7p9rY9CacJDc8cbioP49hjfghDy+29GBOQTgpCNZlv/1FjblAO69Oc13GuGwWEVCRN
         hGR7vc30Vq1rjLGxoFn9Jbadr9yLMBuBrdeBKDOaCfLw88Ktrz26E0UpkD6pnqWA8zMM
         y1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339339; x=1741944139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XztObitingC3692I+pBVpdt55S8NywKGMFDoLFkCI1M=;
        b=gqmXmPgxXFjjQgfwPPd4QNTYHj0M9SEUf33Xk0Ffs13b66EvHbhT0v6MmUL6etm8jq
         cUjtIbu6R93pPXtsda+a5057KJsEPb0stiamAodmaFeAFeI1f8kAwg3Hy6n0nnBAuTeC
         8N1USObAhq3eOhnO1+xi13NQKzrpp1D9r8n6IXT7/G9CHZESICn22qQu9ZzQ79fURb+r
         ebm8d9e7x1/gHxUZY+3J/tGN9oqhQ/UiAcP9ayNS9jxisFWDFj2YljG05RFCTlkdRybs
         f/Gzoph3NKyPpxwA88hSWNHYmTnzPIhjE6bBeijWSKylmKrAcru+IDdv4q1hvByuTPHu
         dmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5qnKW+NJr0IL20fVS2AKr8NWJYAfuqmxw8dR9U1vqCnflVGDwAiVoS+eX36vGkFKQWIeHKrB626I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6ONT0treI3P4UmB50zON5h6vi9G9Jgah9m28qTl7tPYxmVG4k
	ZkBv9MIzlShC9UoNjzbSf8RvxYCd1wBCekLBbcPDcw3lElzhO2x+
X-Gm-Gg: ASbGncsTkz08bfYKoW0D69A3n8odAQiwsLTpjmUCITWU66O877o8TmDCSxb2yqsFPDU
	UYmhx8VXVvoswX3EtBognLkaoOR0MswjpyteB+L331U0F/P3TWE/XOBS0xxQubZxoEt2D3Wf7fD
	JfLB3PddwEE1YzwRZklgbflUWWgjh5sZiHkjryMFHAn5kJ0NjSJU9ZYLU9OUOc9p9aLFae+dYTS
	aXpr3hwnLohxz9Yh480IDD2u8EKHPXYnurdbDLLxWwydu6VfHR0xZN+CIzGQfzOzk9EtD0abd4b
	GGnWtmp+fMqG+zkOAyD/WcojgzChILWO5c2nsfIUmCnL+c1IgtBE4F2rVI2BsSxHHh4Jtc1u
X-Google-Smtp-Source: AGHT+IGO3Fg5mznURfAXFZCPAiOd6NJZ8MzxOEXeMR65d6OVc42NCiVYA5M/yoTVlsiOwEwCHpbcoQ==
X-Received: by 2002:a17:90b:3911:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-2ff7ce8b5ffmr4029616a91.21.1741339339019;
        Fri, 07 Mar 2025 01:22:19 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e7fb5sm2876725a91.37.2025.03.07.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:22:18 -0800 (PST)
Date: Fri, 7 Mar 2025 17:22:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
	yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8q6wPWXImCeGI8P@visitorckw-System-Product-Name>
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

Hi Jiri,

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
> 
In the previous thread, David and Yury had different opinions regarding
the implementation details of the parity() macro. I am trying to find a
solution that satisfies most people while keeping it as simple as
possible.

I cannot point to any specific users who are particularly concerned
about efficiency, so personally, I am not really concerned about the
generated code either. However, I am not a fan of the #if gcc #else
approach, and Yury also mentioned that he does not like the >> 16 >> 16
hack. At the same time, David pointed out that GCC might generate
double-register math. Given these concerns, I leaned toward reverting
to the parityXX() approach.

If you still prefer using the parity() macro, we can revisit and
discuss its implementation details further.

> > Additionally, I changed parityXX() << y users to !!parityXX() << y
> > because, unlike C++, C does not guarantee that true casts to int as 1.
> 
> How comes? ANSI C99 exactly states:
> ===
> true
> which expands to the integer constant 1,
> ===
> 
I gave a more detailed response in my reply to Peter. If we can confirm
that casting bool to int will only result in 1 or 0, I will remove the
!! hack in the next version.

Regards,
Kuan-Wei

