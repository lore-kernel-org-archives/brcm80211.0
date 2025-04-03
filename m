Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5824EF7B
	for <brcm80211@lists.linux.dev>; Thu,  3 Apr 2025 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696849; cv=none; b=WoGrtjVtBw2dgwrwIKiRdmzDNsABKl1QxLXJFAKwcY33+kUruPmfItl3jGWSRqMtI6IJUGuHcP1kMWfvWRaonmVKLGkcGKJdWFy0nZLhUTz/c1i7Wbf9Y78qGce8XcECR9aDgG1ofbymS9t/2HTMqmkUBvm/EY2kcHJu8+qC3Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696849; c=relaxed/simple;
	bh=g4yIIhJXJS+2HpRtFLQZWDfTqppjtp/hIdH2G/MZEpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAUn17NXigHs4Tr6bbQZ8TO4yBH10u+K7BSUCJescHHgPb5jWgw3rNR1S/2P9dAI33+yz3u5D+9ZKGvnkQZ1wr4/COTuDprgykfLb1yb106dBD+F2cU27q8rtUkLqSJ+Flezu8rQaCzFE2wLBQekkHktaT/MRJ0+xdDHtvT+3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtrZoMz3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtrZoMz3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1263892b3a.0
        for <brcm80211@lists.linux.dev>; Thu, 03 Apr 2025 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696847; x=1744301647; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NsvCi3xr0wqbxukv6gNk2KWJs6cd/sHgcwpQSSqpQSc=;
        b=AtrZoMz3D7CzzXxj7L8K2bIzfCRvmRM4AJk8QUFzNfaWxNwgpBMx1uIdpSNzfC5slm
         oisI0QkBHcBcosM5pGj6c+/eyn4dZtR9ZYMdKZjiLnKqb9wdCyCmLJ1J3gA0ckflvRj3
         w3lk9b3ZmmRIFZDvKyIuQIQDTqAeAxa7jGXQHdweZyq6AwAit3yzk5H4ACVGyQFpq0r3
         1t8f0J3uCzRvcQ+dnZziALRwWsv+r3LfvpcsrPumtFIfmvQpwuKkHuAFXqH1SZr7NbJ+
         ZLsbaiPolcus4Z6sr/5vpIRwEXR63ocMaR80bHec2XboEmdrXee/ggBtdncz9MKo9e2d
         M9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696847; x=1744301647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsvCi3xr0wqbxukv6gNk2KWJs6cd/sHgcwpQSSqpQSc=;
        b=DHLTgWKAwWHDvKW8uP0JByh8J4U2guy7fFzwlthYIQ1pTKe6/HeD08yx4N7fJ7QJIA
         VLrq1lce4MfkImjccqFeAmP78B5/oVry5xanRuCAygwbpO+yeK7vQPAVinvMpeNFIMrN
         Hc6xYws5Q9l9QMHKJ5WOsLsqqbHqAv9SrQ4TsZBlWqaz1c9RL0Ebk6h6QH45A8B5rBnT
         fpX4D+bYVSfy1hLbLQZPLObGlVYEm+r5QpnW8IjDBUFepPvgmbDIOuMoq77hQZrbs1U4
         OpuwYfC5LpCLN5LEC6cJceP3nl0u9Nx79j377frVtJSsPElC2JQtFPs/czRM/ZZDIm0H
         7lLw==
X-Forwarded-Encrypted: i=1; AJvYcCUgTxbiE3/0J1jhCfAIUlDgXdzXjwhMoJJ+qwZhtL+TUsj55S8btJ4ZOLHXCPnfz5XBzWAzz3sjgKs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkDWW4P83hqrqEcnr9mer89VNpJBxd3asMlLYTk7A4nJ9ABRK9
	Jzy4Yz6z+rCW2V5ikNNDtktZHWWq8u9JPm974Cg9y9vvAGwPKbGw
X-Gm-Gg: ASbGncvgGOB94f74qDYeMUqq+0npUMa9j0fQ/9o7K6eHetiZNn2mSlCVprWgj4INw/s
	ZpG2uwohfE+EAL62wO73Q2P7spUmoim+efH/1heMTj986PrKrtK9u61swbF/Lr7eFzswAEQeBJv
	xkP9wUTH7KHxbH8syoK8PHHhODfgTE0v73aETrWzzUOCOBNabegW7Td3F/qHE3MvhA2JmQp5Pgp
	7zUeD4SHIZPxNV5BYfVrucCZmWz7hMAVgxJDlD/5zkz0aApSDFjl4WW2is6q2lUFfh7H1/bSQqt
	bY+7v6IxLp5yjYZfSupvXqojG0h9jOedTytyBuLon+US
X-Google-Smtp-Source: AGHT+IGVU2+2TkhGwc9XcrbXTU+jprAkGrGQEy4B9m6YI+h73paRxRK7YqS+QjyFE8ZrGike3yIkRw==
X-Received: by 2002:a05:6a20:c886:b0:1ee:47e7:7e00 with SMTP id adf61e73a8af0-200f55ecf4dmr5333762637.13.1743696847264;
        Thu, 03 Apr 2025 09:14:07 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc3fd41dsm1416486a12.50.2025.04.03.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:14:06 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:14:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
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
Message-ID: <Z-6zzP2O-Q7zvTLt@thinkpad>
References: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>

On Thu, Apr 03, 2025 at 10:39:03PM +0800, Kuan-Wei Chiu wrote:
> On Tue, Mar 25, 2025 at 12:43:25PM -0700, H. Peter Anvin wrote:
> > On 3/23/25 08:16, Kuan-Wei Chiu wrote:
> > > 
> > > Interface 3: Multiple Functions
> > > Description: bool parity_odd8/16/32/64()
> > > Pros: No need for explicit casting; easy to integrate
> > >        architecture-specific optimizations; except for parity8(), all
> > >        functions are one-liners with no significant code duplication
> > > Cons: More functions may increase maintenance burden
> > > Opinions: Only I support this approach
> > > 
> > 
> > OK, so I responded to this but I can't find my reply or any of the
> > followups, so let me go again:
> > 
> > I prefer this option, because:
> > 
> > a. Virtually all uses of parity is done in contexts where the sizes of the
> > items for which parity is to be taken are well-defined, but it is *really*
> > easy for integer promotion to cause a value to be extended to 32 bits
> > unnecessarily (sign or zero extend, although for parity it doesn't make any
> > difference -- if the compiler realizes it.)
> > 
> > b. It makes it easier to add arch-specific implementations, notably using
> > __builtin_parity on architectures where that is known to generate good code.
> > 
> > c. For architectures where only *some* parity implementations are
> > fast/practical, the generic fallbacks will either naturally synthesize them
> > from components via shift-xor, or they can be defined to use a larger
> > version; the function prototype acts like a cast.
> > 
> > d. If there is a reason in the future to add a generic version, it is really
> > easy to do using the size-specific functions as components; this is
> > something we do literally all over the place, using a pattern so common that
> > it, itself, probably should be macroized:
> > 
> > #define parity(x) 				\
> > ({						\
> > 	typeof(x) __x = (x);			\
> > 	bool __y;				\
> > 	switch (sizeof(__x)) {			\
> > 		case 1:				\
> > 			__y = parity8(__x);	\
> > 			break;			\
> > 		case 2:				\
> > 			__y = parity16(__x);	\
> > 			break;			\
> > 		case 4:				\
> > 			__y = parity32(__x);	\
> > 			break;			\
> > 		case 8:				\
> > 			__y = parity64(__x);	\
> > 			break;			\
> > 		default:			\
> > 			BUILD_BUG();		\
> > 			break;			\
> > 	}					\
> > 	__y;					\
> > })
> >
> Thank you for your detailed response and for explaining the rationale
> behind your preference. The points you outlined in (a)–(d) all seem
> quite reasonable to me.
> 
> Yury,
> do you have any feedback on this?
> Thank you.

My feedback to you:

I asked you to share any numbers about each approach. Asm listings,
performance tests, bloat-o-meter. But you did nothing or very little
in that department. You move this series, and it means you should be
very well aware of alternative solutions, their pros and cons.

Instead, you started a poll to pick the best solution. This is not
what I expected, and this is not how the best solution can be found.

To H. Peter and everyone:

Thank you for sharing your opinion on this fixed parity(). Your
arguments may or may not be important, depending on what existing
users actually need. Unfortunately, Kuan-Wei didn't collect
performance numbers and opinions from those proposed users.

I already told that, and I will say again: with the lack of any
evidence that performance and/or code generation is important here,
the best solution is one that minimizes maintainers' (my!) burden.

In other words, bool parity(unsigned long long). I'm OK to maintain
a macro, as well. I understand that more complicated solutions may be
more effective. I will take them only if they will be well advocated.

I hope this will help us to stop moving this discussion back and forth
and save our time, guys.

Thanks,
Yury
