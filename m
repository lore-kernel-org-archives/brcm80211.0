Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1EE1C860C
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741372220; cv=none; b=WcEPnnsZLKEJ4jUoCZMS3z4E5v+VWBL7yKZ5T8OjXv6NtdINt6dXiqc/0C6r2/zN5RfTiojIbBioYLXYaUXBegRacqe8m9nUnxlMPulr5L86afCmTUUXu4a6uyy/JGBj8tYG91OENfGGyPORNrr3pTPWngDd1Yqf8bmJBi5ltYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741372220; c=relaxed/simple;
	bh=EG2i3mXMsc7HiAgkyOkrmMVNlKKHXZ/6dKrOfBJXUBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeahBgH7BVxU3KigZT2S1O7bZRwH86Yas7TnhxOmL81dE8NpksIGoYFyilgjSxrE73pPUJfzDpFwUZ/AFDWF/8P3ohKYq2KSdnW/eT/CKyoQ1dl+EC0PcA+gucE8UWBOQ6oAM5KrIappZqBrjPDdkkBnwUrRaMYRfsRbTNptDRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LolRwuWy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LolRwuWy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2232aead377so45522315ad.0
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741372218; x=1741977018; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADljs+6QUrhT8gv23eyNcU2smhHAIyZh+jPjPfAngag=;
        b=LolRwuWyPIJhh2Toj7RH+NfaDzYjg+qutlNlbXzjQv3NLjeNdIc71D1FBtoqNbsOjq
         jfaCJ7p6IllcgDhtnexwvfuSOkjQG9WW3RtEsH6OBF59TAzLq8OaZiMQfNO2hdRijG9I
         nagPBiqy90qOjfAoY7TWEmbDZ63iIv+Hgxb2+jrydKpioIYfuFFnZU4S1ekPBP0C9/OK
         vVUAogFRx/+2QXgDD75EJfppBBkJal8oEAt4fl4KVrVzjQwU6LNrqjIqO6+doG+e/EhS
         gp5jU/dk81KQJkllSsxguVbnYRifhC1YWXRvXM/uN7eR1q3anzsFzS9ulXOmZmOYG1+f
         HQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741372218; x=1741977018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADljs+6QUrhT8gv23eyNcU2smhHAIyZh+jPjPfAngag=;
        b=sG6n270K7TbCND61Vrzk4MfUAOyqFKA1L2/1PTHfQvEdpaTQ3DzqVNr+i8OWx1P2QQ
         fe9aGBXu5yU2iLg4890pYpxb8M7ZtjF9EX0SlLozKsdlFcJhcqYnfvR+j/7CRe7BLjAn
         m7/mMJai3+A5LMGWhbtoIpo2cI0Eg31UCgb1EwAYehLhO4IqYeLyK7L3SGFe1psHcRrL
         4+g8028ZLvYhM+LlRvXcFDpywytKHK/mbdjGL7VctXBj22vlNDtoQWj5KflMVwCDkMDs
         1ANUP9YQdf/YW27FuUHqajoIioDeZxIF5zuZU0gQTUfQ7B/2fMlELMBZMIeG8nVrJFAJ
         gVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Dn+/cohvIPnslcEZz+XevzLgvSq5eX8JxK4OfrptMZv8RpL01A/aGBMHt87klKHJquWZ+J8xVyM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb8fZjiTJpx69qFFjLqC/v/NSuE1XovcckuXRQ9iT30Qq5SMoL
	KtVwhcJVdtZWjRl17tQpYE9jbMRIos58pAKRCZGecd37P77vaiIA
X-Gm-Gg: ASbGncsOHPzxYpo8eqPASA3ej00/ZwZQLihuocY1hikN21cTJdUUVyTv7vI7tlBpoPf
	ok9jlLx4Wd+Q2TPgSZ6YVVjrij7VDP4rCywE8S1iyODsKnurbx+mvOlFlAVZBqtDDbDn4nmbUEr
	09NYfmgoQ/jEtFyIrGAixKj+IH8ykfIgmreo37IKNvv8bq2XTkOw2L/ChwK5AjFeGA3evV7hi2F
	8Nea8Qqb3s01f/CoHvLmb0Vvit5w1qES6wfRIESuyQRrADqSbSxrJsz9PMCPsaz3ZlOvSMbfiSE
	4Jxli4yphyvUEfYadkUxKc0/h5dgYyuv7D1nBSUp0xbOQa+kr9k2h4g+3UuWlIapkTPlAZHb
X-Google-Smtp-Source: AGHT+IHgn9VYVN+pY6VrcRSpGmZ1OnVGCCY/wp+YVj8MkJGAiDKX4lh0yxX6MBBGMkwIe7/wx2wiPQ==
X-Received: by 2002:a05:6a00:139a:b0:736:520a:58f9 with SMTP id d2e1a72fcca58-736aaadf082mr5830777b3a.17.1741372218220;
        Fri, 07 Mar 2025 10:30:18 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f7268sm3588473b3a.116.2025.03.07.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 10:30:17 -0800 (PST)
Date: Sat, 8 Mar 2025 02:30:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
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
Message-ID: <Z8s7L+ZCI/yM5qm4@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
 <Z8sW4c5LxV-ITdCi@thinkpad>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8sW4c5LxV-ITdCi@thinkpad>

Hi Yury,

On Fri, Mar 07, 2025 at 10:55:13AM -0500, Yury Norov wrote:
> On Fri, Mar 07, 2025 at 07:57:48AM +0100, Jiri Slaby wrote:
> > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel contain redundant implementations of parity
> > > calculations for 16/32/64-bit values. Introduces generic
> > > parity16/32/64() helpers in bitops.h, providing a standardized
> > > and optimized implementation.
> > > 
> > > Subsequent patches refactor various kernel components to replace
> > > open-coded parity calculations with the new helpers, reducing code
> > > duplication and improving maintainability.
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > > In v3, I use parityXX() instead of the parity() macro since the
> > > parity() macro may generate suboptimal code and requires special hacks
> > > to make GCC happy. If anyone still prefers a single parity() macro,
> > > please let me know.
> > 
> > What is suboptimal and where exactly it matters? Have you actually measured
> > it?
> 
> I asked exactly this question at least 3 times, and have never
> received perf tests or asm listings - nothing. I've never received
> any comments from driver maintainers about how performance of the
> parity() is important for them, as well.
> 
To be clear, I use parityXX() was mainly because you dislike the >>
16 >> 16 hack, and I dislike the #if gcc #else hack—not due to
performance or generated code considerations.

> With the absence of _any_ feedback, I'm not going to take this series,
> of course, for the reason: overengineering.
> 
I'm quite surprised that three separate one-line functions are
considered overengineering compared to a multi-line approach that
requires special handling to satisfy gcc.

> With that said, the simplest way would be replacing parity8(u8) with
> parity(u64) 'one size fits all' thing. I even made a one extra step,
> suggesting a macro that would generate a better code for smaller types
> with almost no extra maintenance burden. This is another acceptable
> option to me.
> 
I'm fine with unifying everything to a single parity(u64) function.
Before I submit the next version, please let me know if anyone has
objections to this approach.

Regards,
Kuan-Wei
