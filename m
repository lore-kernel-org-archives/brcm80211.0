Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5E1F4295
	for <brcm80211@lists.linux.dev>; Mon, 24 Mar 2025 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742831620; cv=none; b=b4FPLgqW5314/w1RqyIUUy4JVAOgB8gvBJ3blFkqwpDjy7d/ORfjlO5Cwp1CEE1LmTYRr0dWteNPFgwqKsvMB2b2v7wrRWWbrcrC3FA0obuZMdHZZLTcMKlddQndOqLAqxGJjqt2xeobqrBlhbm/6b6MIVTm56tFKM5jtIRmY4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742831620; c=relaxed/simple;
	bh=4jXCcTm30AJQi4N1CnuKV/ZoTyk5Joxp7KbG+aaJZ/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0w52R9rRhonp7RZYrx7BMJNYZoWjbNcf7whb36GQYbBzNxxCxoJhsQ+RfA2VH/qXELtix1SE6vrp+X7DDGLfMs5Xpwp5oft5+bXbdIgCDBDtWG5WmcDfRarTMjGyPzEOH9+iGeuWX4dH0HG9DPow0jDdeQ4Os6QAIf2SKub1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GxNdwN0G; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxNdwN0G"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fd89d036so88602445ad.1
        for <brcm80211@lists.linux.dev>; Mon, 24 Mar 2025 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742831618; x=1743436418; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lnK90d9tJkBMNCcbTrjmAdHYPBfyopuTDuiHWu7djtw=;
        b=GxNdwN0GNHoF3LWH27aXNFpnmpfHD7USkI3xgEXXl50JJBgbqJ0m/xsRMQSwhS2pn8
         0okqyb6o7cPsTkhwm7cNIZUCX4FWY/8e7Ka+IsYK+6k+R6AqnNrNKVa7cnIBAtCyMSun
         6o95FqirDdJbbYD2rroYt2ncMgi9C8vsip/TJelZLxI1fJHU5Fui9VxM94Skg11hR9qZ
         NwxKy55B2hAXFD/hfjNs1wCELs/FnOQL5YRJM2bFo2PfrIhXZxItcD0HPXdZhwX9vdiu
         qt4eQx9Joni5H65xlKDqZO4sGv3O0lhheGpXFlNAd+8rmJmmql4686rz6BHj5JptXMCw
         CQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831618; x=1743436418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnK90d9tJkBMNCcbTrjmAdHYPBfyopuTDuiHWu7djtw=;
        b=VRh0awSk80qHWN9t6W5rtRxc5z00qfHNAvJUi/K5u/FgfNocyYBZypdiY4zDwV0mXr
         mJOP2ollt2LE8usTMMkSC4Pt2OzxO4pwcTLa1RYSyEnxURXSvLU6SXvqdQWRRabtClNs
         qQ8rInhnSeYF1+cTfRZh57tLZntEGOhho+/bXWfA7dZ44LDK08h8mi/f/JVHj2PaYvqJ
         4Vv4Q4Ig829wlnTB2Hp8rsd6tG6dmP6bxZIP4e9UOzkD264IWqb94ulXG/2a1BOxMzFE
         aXas0MagLSVMnwOQ/S7vSfJyTKTbrrzVNNY+/oYWv0/3cVmscWQWlKW7X2FjeKoK6bsr
         63OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlRiAbiYMzoSOnIXPg0CAtowtJBQPDs+0LCXHkm7itmu+kfrTqlyebegv0gz39dwizAvV7lqJYn7M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7IJElzhxN7HkZkLrXUccEWnU+hC+0wGfAGHdxQzExhSvn7szi
	6tSuzkIHKAvJCwLtRWPx6U8r79Pc1/7eROqXpJVAaonxgkGaGCwX
X-Gm-Gg: ASbGncs1K02vFeq/wd9oYtz54Wjn68k3dvo/gxXzfPIe8COGpG99GNU13b/av4xmbua
	/BTeqKYKvGpV2fLAjiuKU/d0UPP3ersUXuEB7u9Wj+JwpEY60t5Z/5FEJeTPxAyXG35qpHRiSpE
	OY4x06mwoO45xvHxNcNZdU0GC1iGPGq2DwEa9p/Hn+7KAxw24tQ41/be7KTSjCWZHsw0TSZq5cz
	7CN5D+Vj0neKb2mxnZx1I/IqD6Jb747Sl0aLB9dHwLfowWDCtkmX7TNeYjbqBWSiwgAZKu2TwDx
	gSYp9dz3M4dOfdSNThfEf+ATWzgdPYiZnOpUxYGpWNjnb84/qRqO4xwghO0rf8TRnUfEsEvht3P
	sD0w=
X-Google-Smtp-Source: AGHT+IF0G/P2idoIFxvn1IOSBSyy+/lpGPgy71fA+n6lIv43FiatMDA7/IWCIIb00BiyzdXZ3fQN0Q==
X-Received: by 2002:aa7:9317:0:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-7390596685bmr25612682b3a.8.1742831617683;
        Mon, 24 Mar 2025 08:53:37 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a5f6sm8119083b3a.82.2025.03.24.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:53:36 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:53:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z-F_96AECHpsCXsL@thinkpad>
References: <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>

On Sun, Mar 23, 2025 at 03:40:20PM -0700, H. Peter Anvin wrote:
> On March 23, 2025 8:16:24 AM PDT, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >On Thu, Mar 13, 2025 at 03:41:49PM +0800, Kuan-Wei Chiu wrote:
> >> On Thu, Mar 13, 2025 at 12:29:13AM +0800, Kuan-Wei Chiu wrote:
> >> > On Wed, Mar 12, 2025 at 11:51:12AM -0400, Yury Norov wrote:
> >> > > On Tue, Mar 11, 2025 at 03:24:14PM -0700, H. Peter Anvin wrote:
> >> > > > On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury.norov@gmail.com> wrote:
> >> > > > >On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> >> > > > >> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> >> > > > >> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> >> > > > >> > >On Fri, 07 Mar 2025 11:30:35 -0800
> >> > > > >> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >> > > > >> > >
> >> > > > >> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> > > > >> > >> >> (int)true most definitely is guaranteed to be 1.  
> >> > > > >> > >> >
> >> > > > >> > >> >That's not technically correct any more.
> >> > > > >> > >> >
> >> > > > >> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> >> > > > >> > >> >other than 0 and 1.
> >> > > > >> > >> >
> >> > > > >> > >> >https://gcc.gnu.org/gcc-14/changes.html
> >> > > > >> > >> >
> >> > > > >> > >> >~Andrew  
> >> > > > >> > >> 
> >> > > > >> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> >> > > > >> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> >> > > > >> > >> or anything even remotely like it.
> >> > > > >> > >> 
> >> > > > >> > >
> >> > > > >> > >The whole idea of 'bool' is pretty much broken by design.
> >> > > > >> > >The underlying problem is that values other than 'true' and 'false' can
> >> > > > >> > >always get into 'bool' variables.
> >> > > > >> > >
> >> > > > >> > >Once that has happened it is all fubar.
> >> > > > >> > >
> >> > > > >> > >Trying to sanitise a value with (say):
> >> > > > >> > >int f(bool v)
> >> > > > >> > >{
> >> > > > >> > >	return (int)v & 1;
> >> > > > >> > >}    
> >> > > > >> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> >> > > > >> > >
> >> > > > >> > >I really don't see how using (say) 0xaa and 0x55 helps.
> >> > > > >> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> >> > > > >> > >from that.
> >> > > > >> > >
> >> > > > >> > >	David
> >> > > > >> > 
> >> > > > >> > Did you just discover GIGO?
> >> > > > >> 
> >> > > > >> Thanks for all the suggestions.
> >> > > > >> 
> >> > > > >> I don't have a strong opinion on the naming or return type. I'm still a
> >> > > > >> bit confused about whether I can assume that casting bool to int always
> >> > > > >> results in 0 or 1.
> >> > > > >> 
> >> > > > >> If that's the case, since most people prefer bool over int as the
> >> > > > >> return type and some are against introducing u1, my current plan is to
> >> > > > >> use the following in the next version:
> >> > > > >> 
> >> > > > >> bool parity_odd(u64 val);
> >> > > > >> 
> >> > > > >> This keeps the bool return type, renames the function for better
> >> > > > >> clarity, and avoids extra maintenance burden by having just one
> >> > > > >> function.
> >> > > > >> 
> >> > > > >> If I can't assume that casting bool to int always results in 0 or 1,
> >> > > > >> would it be acceptable to keep the return type as int?
> >> > > > >> 
> >> > > > >> Would this work for everyone?
> >> > > > >
> >> > > > >Alright, it's clearly a split opinion. So what I would do myself in
> >> > > > >such case is to look at existing code and see what people who really
> >> > > > >need parity invent in their drivers:
> >> > > > >
> >> > > > >                                     bool      parity_odd
> >> > > > >static inline int parity8(u8 val)       -               -
> >> > > > >static u8 calc_parity(u8 val)           -               -
> >> > > > >static int odd_parity(u8 c)             -               +
> >> > > > >static int saa711x_odd_parity           -               +
> >> > > > >static int max3100_do_parity            -               -
> >> > > > >static inline int parity(unsigned x)    -               -
> >> > > > >static int bit_parity(u32 pkt)          -               -
> >> > > > >static int oa_tc6_get_parity(u32 p)     -               -
> >> > > > >static u32 parity32(__le32 data)        -               -
> >> > > > >static u32 parity(u32 sample)           -               -
> >> > > > >static int get_parity(int number,       -               -
> >> > > > >                      int size)
> >> > > > >static bool i2cr_check_parity32(u32 v,  +               -
> >> > > > >                        bool parity)
> >> > > > >static bool i2cr_check_parity64(u64 v)  +               -
> >> > > > >static int sw_parity(__u64 t)           -               -
> >> > > > >static bool parity(u64 value)           +               -
> >> > > > >
> >> > > > >Now you can refer to that table say that int parity(uXX) is what
> >> > > > >people want to see in their drivers.
> >> > > > >
> >> > > > >Whichever interface you choose, please discuss it's pros and cons.
> >> > > > >What bloat-o-meter says for each option? What's maintenance burden?
> >> > > > >Perf test? Look at generated code?
> >> > > > >
> >> > > > >I personally for a macro returning boolean, something like I
> >> > > > >proposed at the very beginning.
> >> > > > >
> >> > > > >Thanks,
> >> > > > >Yury
> >> > > > 
> >> > > > Also, please at least provide a way for an arch to opt in to using the builtins, which seem to produce as good results or better at least on some architectures like x86 and probably with CPU options that imply fast popcnt is available.
> >> > > 
> >> > > Yeah. And because linux/bitops.h already includes asm/bitops.h
> >> > > the simplest way would be wrapping generic implementation with
> >> > > the #ifndef parity, similarly to how we handle find_next_bit case.
> >> > > 
> >> > > So:
> >> > > 1. Kuan-Wei, please don't invent something like ARCH_HAS_PARITY;
> >> > > 2. This may, and probably should, be a separate follow-up series,
> >> > >    likely created by corresponding arch experts.
> >> > > 
> >> > I saw discussions in the previous email thread about both
> >> > __builtin_parity and x86-specific implementations. However, from the
> >> > discussion, I learned that before considering any optimization, we
> >> > should first ask: which driver or subsystem actually cares about parity
> >> > efficiency? If someone does, I can help with a micro-benchmark to
> >> > provide performance numbers, but I don't have enough domain knowledge
> >> > to identify hot paths where parity efficiency matters.
> >> > 
> >> IMHO,
> >> 
> >> If parity is never used in any hot path and we don't care about parity:
> >> 
> >> Then benchmarking its performance seems meaningless. In this case, a
> >> function with a u64 argument would suffice, and we might not even need
> >> a macro to optimize for different types—especially since the macro
> >> requires special hacks to avoid compiler warnings. Also, I don't think
> >> code size matters here. If it does, we should first consider making
> >> parity a non-inline function in a .c file rather than an inline
> >> function/macro in a header.
> >> 
> >> If parity is used in a hot path:
> >> 
> >> We need different handling for different type sizes. As previously
> >> discussed, x86 assembly might use different instructions for u8 and
> >> u16. This may sound stubborn, but I want to ask again: should we
> >> consider using parity8/16/32/64 interfaces? Like in the i3c driver
> >> example, if we only have a single parity macro that selects an
> >> implementation based on type size, users must explicitly cast types.
> >> If future users also need parity in a hot path, they might not be aware
> >> of this requirement and end up generating suboptimal code. Since we
> >> care about efficiency and generated code, why not follow hweight() and
> >> provide separate implementations for different sizes?
> >> 
> >It seems no one will reply to my two emails. So, I have summarized
> >different interface approaches. If there is a next version, I will send
> >it after the merge window closes.
> >
> >Interface 1: Single Function
> >Description: bool parity_odd(u64)
> >Pros: Minimal maintenance cost
> >Cons: Difficult to integrate with architecture-specific implementations
> >      due to the inability to optimize for different argument sizes

How difficult? It's just as simple as find_next_bit(). I already
pointed that.

> >Opinions: Jiri supports this approach
> >
> >Interface 2: Single Macro
> >Description: parity_odd() macro
> >Pros: Allows type-specific implementation
> >Cons: Requires hacks to avoid warnings; users may need explicit

So if the hack is documented, it's OK. I don't know the other way to
motivate compilers to get better other than pointing them to their
bugs.

> >      casting; potential sub-optimal code on 32-bit x86

Any asm listings? Any real impact?

> >Opinions: Yury supports this approach
> >
> >Interface 3: Multiple Functions
> >Description: bool parity_odd8/16/32/64()
> >Pros: No need for explicit casting; easy to integrate

Explicit castings are sometimes better than implicit ones.

> >      architecture-specific optimizations; except for parity8(), all
> >      functions are one-liners with no significant code duplication
> >Cons: More functions may increase maintenance burden

s/may/will/

> >Opinions: Only I support this approach
> >
> >Regards,
> >Kuan-Wei
> 
> You can add me to the final option. I think it makes most sense

This is not a democracy, and we are not voting here. We are engineers.
We share our expert opinions and choose the best one. I'll be happy to
go with any solution, if we all make sure it's the best.

I'm for #2 because it 
 - generates better code than #1;
 - easier to use than #3; and
 - has less maintenance burden than #3.

Why exactly #3 makes the most sense to you? Most variables are ints
and longs. How are you going to handle those with fixed-types parity()s?

Thanks,
Yury
