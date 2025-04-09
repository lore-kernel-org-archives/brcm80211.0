Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16118CBE1
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223591; cv=none; b=ojcXxcFCSHeQtp4DcX+aQPcUY7vfLRalCJRE5+Z1UOcofI2y9bQrcabgPpIau874AoesqNSPTmJb5w6hkea4fINayNsjYlQUJ2jbdkMuJxND2oXXzUUugwuSGvNcp+tiFqN1QS8HwxDfLymklcm88u/Vfj5JAvLcxYwSVc/jtWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223591; c=relaxed/simple;
	bh=MGeq7y7ME+KPgk832sLNyoOePOBNHMNAWhFiPL63pr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5LHIbhTXFheNIkWXuZLX0pJaO6uzEqFSzPSyFrs1vHaS86g8HL6hrTmAlKIfjGHNFfntYB/aj2rkSzZOLy818Im+p9pMvu+Obl07TTV3pnswLZ6Wjuxl/DezfL8VJAua6v/RebafZus32WT3XbHrWOzsm0mdKAdKUmh7VGYCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGqWVQb3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGqWVQb3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22580c9ee0aso79353085ad.2
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223589; x=1744828389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pEZZtQmHxD6cS3JefhP/59PsGmANbj8tqGBgctIT62U=;
        b=VGqWVQb37oBzugImzfXL1PvKloGurDp3QX/NCl7r00oGZSXLT8PolexJ0GcjZsOnQ0
         gyszsFmnPDrNUYt/yo8FaInuXCZJl3QAJ93JPV7leNkmBtZ4858CRqD+V4lElgL/D0OK
         JBml50e9MSIbwCWDMBb/4qdi4ZvE1n5Ifv26+a4ukxjjg9w29EylA/xXLnVcps4YLjWU
         AY5DojGTfBLkDZaFfYMElrlYs7Q2PiwcswhqhXiP7vfrHFDffnX7dL4BX6nwP8KnZPCz
         2KHxxdBoAq5QoJBrgL1jWELbCF6cdyM6kMcYDNhgY+LuguF9p0kZtah4oVYagYGtG+O3
         ruwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223589; x=1744828389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEZZtQmHxD6cS3JefhP/59PsGmANbj8tqGBgctIT62U=;
        b=D7+FGJI6rw41VnYS9ow8TTFEuU+x9F/6vDxk5/6cJUU6GnYUorz5Svs0Xb5WLFsfSZ
         M+zP2NS9sEtWT9HrRjQO4Ok/iZvVeV7UREJ9S3OQTVMmkhkU4KFkBgUKoV/edOw5CHW0
         XKB4e/6VkBMeMO5bydQirGfJ7ULCTDwm0C7HdEFE1gwE/dEl8Sv2ci4joqh7JpMkSHbL
         07+yDPzjgnQOmSlNwwu+YDJyMKrqe/ZDBfj8bEvlNItHKKNejGvujJXzxBcsfpIasw71
         A1FW6MB/ZAMaj7dCQKSDyD3hLSBneabrb7+Bc8gtKvX3Msmn2bGstuKh1ccXCzvEXAfq
         Q6/w==
X-Forwarded-Encrypted: i=1; AJvYcCURNHBtFO9i3/vcp3BiRJtYC9wUZ0k9Y129Q03kJUWYHbNs2PXIBOSTaqNrVtbzTPATWldUr8YyxMs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzavQ14g4Bq5SSCR4BRi8r8EznqBa8JZelJTcdFnkB2LSjwmCDE
	o/Dh45FQVimU5GxLzoSg0X2WmywfrwU8c8fnRMfEdwII0Xe/OoGt
X-Gm-Gg: ASbGncuVNtTiQ2pdvWSWUJdvPu+HiZXkv3VRvRHXIPTBTlWfAR3KOKSkjo0RlleVSY0
	HpVkvf9PW04VI9fTc6YeH4RJuP3cQTv+cXX89RcqfEQfzH1KcREeNz4ILz7jejE1d9vkHflZpZn
	4Yq/VgJhFKDPoO9I43lmq3QOzLvGesGX2WEgGpAqaz6WjmDPowRmhA7JmFIKq6EFqpHqr101dMk
	M7+6zb8ZE0coWa3JbFqULyNjsoGWC4Hwn+KqlL7fh2zO1+70Wt7e3BQMStYySuodN4OXXJTZRxA
	/PzpvTvjbh3DFordJQQULZT83w4sgWYVYRMy0uyn
X-Google-Smtp-Source: AGHT+IE8wK8xLsT0Kpo2+eqnCnHqRBL6GoNWR5XNtZUkQwRprgm7rO+knOmPkUYsLXDP1SYqhAYEsw==
X-Received: by 2002:a17:903:2f86:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22ac2a25780mr61351915ad.37.1744223589016;
        Wed, 09 Apr 2025 11:33:09 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0817f2dsm1575586a12.11.2025.04.09.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:33:08 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:33:06 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
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
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z_a9YpE46Xf8581l@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>

On Thu, Apr 10, 2025 at 02:15:30AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 12:54:35PM -0400, Yury Norov wrote:
> > On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel contain open-coded and redundant
> > > implementations of parity calculation. This patch series introduces
> > > a unified helper, parity_odd(), to simplify and standardize these
> > > cases.
> > > 
> > > The first patch renames parity8() to parity_odd(), changes its argument
> > 
> > Alright, if it's an extension of the area of applicability, it should be
> > renamed to just parity(). I already shared a table that summarized the
> > drivers authors' view on that, and they clearly prefer not to add the
> > suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 
> > 
> > https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/
> > 
> > Yes, the argument that boolean function should explain itself sounds
> > correct, but in this case, comment on top of the function looks enough
> > to me.
> > 
> > The existing codebase doesn't care about the suffix as well. If no
> > strong preference, let's just pick a short and sweet name?
> > 
> I don't have a strong preference for the name, but if I had to guess
> the return value from the function prototype, I would intuitively
> expect an int to return "0 for even and 1 for odd," and a bool to
> return "true for even, false for odd." I recall Jiri and Jacob shared
> similar thoughts, which is why I felt adding _odd could provide better
> clarity.

I think they said they are convinced that parity should return 1 for
odd because of folding and __builtin_parity() arguments.
 
> However, I agree that if the kernel doc comment is clear, it might not
> be a big issue. But David previously mentioned that he doesn't want to
> rely on checking the function's documentation every time while reading
> the code.

He's wrong. Kernel engineers _must_ read documentation, regardless.
 
> Regardless, I'm flexible as long as we all reach a consensus on the
> naming.
> 
> > > type from u8 to u64 for broader applicability, and updates its return
> > > type from int to bool to make its usage and return semantics more
> > > intuitive-returning true for odd parity and false for even parity. It
> > > also adds __attribute_const__ to enable compiler optimizations.
> > 
> > That's correct and nice, but can you support it with a bloat-o-meter's
> > before/after and/or asm snippets? I also think it worth to be a separate
> > patch, preferably the last patch in the series.
> > 
> I quickly tested it with the x86 defconfig, and it appears that the
> generated code doesn't change. I forgot who requested the addition
> during the review process, but I initially thought it would either
> improve the generated code or leave it unchanged without significantly
> increasing the source code size.

That's what I actually expected, but was shy to guess openly. :). It's
hard to imagine how compiler may improve code generation in this case...

This attribute is used when there's an asm block, or some non-trivial
function call. In this case, the function is self-consistent and makes
no calls. And you see, const annotation raises more questions than
solves problems. Let's drop it.

Thanks,
Yury
