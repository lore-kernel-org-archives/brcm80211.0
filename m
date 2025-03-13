Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9126E26989D
	for <brcm80211@lists.linux.dev>; Thu, 13 Mar 2025 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883084; cv=none; b=cBCvIO8Yc7tavbznBrYxYv++4EspjkhkZnlR5GhHVk5Xai6726b3JbcPwdLo0KgrLsb/ygTj+3ktCMEl79z7lphmng4XnJh6/aaQ2/fzZBpMDDGNwnG1ryGUBMg/ssYUFHIybCcouo5y7n801q+PS9pxUijNoe6oddvnSXR+qYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883084; c=relaxed/simple;
	bh=qRKmvdz41Z9reFxLxCZQ5RSEmJTdaZd8ctgs5m87/cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8QrlLM1alUUg/I8SBoygQwS5VkcNC5IITPGcDNppFscESx3muC15P4A8zzUzd5f+uWOrUyo5s1vW/SYQAZS8dKaM2mfoG2MtkC/EX16LOLlcX6o0Zi2i9uGmTAMZiZnrcw8jD8MX6GSZqLe51Occo1shzjGVMd7UUi1TUBviZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZ5tuH5N; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZ5tuH5N"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-219f8263ae0so22876855ad.0
        for <brcm80211@lists.linux.dev>; Thu, 13 Mar 2025 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741883082; x=1742487882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfjeDfcFtBUkNo/zS3F1TWi9ohbnRv2k3DpKMTE74P8=;
        b=GZ5tuH5NhFmc7CAWSqGswkIH5XZ/ClOG5i8eSgM47vPXrJIiXO9Okht6glY9XVlr87
         d9vjPP0UriunpLDFSKB1mVs3lLOZkv6M3DiWLhMFCV/Zlb+aUqENqrAi6DsmHuYO11Z3
         VDYVuHCWSe1fYbzy4A2o8VzBr0mjxPHVH2WGRJu7IwI5iwNdnOHIJBCKniHjdC9J/FOn
         oZyWk+CSw6cP2yaATP01RGl0IpkKCrfTcB0U56MnXtIFjpiI+gMzyw7jCI1T002kQrH/
         y8FfcylR50hoUdRbCJoJWA4tX/LJM0b9H+D8yFzEQohZ/qcedS23idp85KErQr5Ft/vM
         YCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883082; x=1742487882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfjeDfcFtBUkNo/zS3F1TWi9ohbnRv2k3DpKMTE74P8=;
        b=Gff2rZXjlIJsdLzs/xIgdNfnbUJZ5OlHXGP4wnve8e4X92Pl755Me1PfU8EMz1qOdy
         f+3wy00mUBETGbre1psWHioy16q+VfqG1VW4wST4pdOV6K/Lw+Gki5PTnfZvFWB+YKTI
         APiIQBSHfTLDuFqrLk3yDd3j7Uzam1Q52yQxHejVGhmpnrtwiJMayLRWGquhQdVZIqS1
         /Y9xs7FqzOZmY2KWR+fQq+w/uFcHz7o5XXE+qr56DDRRMA6JrZRnf3J8q3l/zg+1Hy9H
         9j5ZkM8C7kpZv1y7m/2LR6oX2qc2aMvuhis/Ig8/B+sQ2b9GXFcRroPgocwY3s0VSMIJ
         Xi+g==
X-Forwarded-Encrypted: i=1; AJvYcCUlhUXs+9pVHGZYTLyvDCjaKxJfayB6BqQIJXfGUp9BMxOAk3unGgj5G/8fhS5YnUdJOHZzvCHS+kE=@lists.linux.dev
X-Gm-Message-State: AOJu0YznMRunwBIwMfDJZaD+wCtfHBr4sGHtXcJPayzP+VR9I9+uf1HT
	fqV9427PD/oa4x8mGs0fTH21Ac9DGi3slFrmlZJ1fx6aAbep3o4K
X-Gm-Gg: ASbGncvY1/006nNGxi8jujsz6Uu4nHqNIgBjvkgMHciFRdeMukF+0D4F3+XosUtUTSE
	wgiex1W/3FuW2Rebu8mIOxU1mQR7RiYE7vvZZTWWaZPPSaUI1Bvk/u0u+Bv2lBHYPVG4XIGOVAf
	Ou0DdMEARMzbMqnkQyB7Y4YDuERGyTapvqV3mV0NZnviWuqRpkqo+hS2MCRDe7skGuXhPsXtAPF
	CY1mf1quNXiPj1CqFebfS0hrBRQ4Cp0NBmFH+W4MhEOHJ6MUxjajeXygiC3uJZN7ni/EEXoYfF9
	9tZMamWuJ6xu2GqP0e/EnMrG+YlP9aTdkg6fBNoyQkP4fxlxue5Lvg0=
X-Google-Smtp-Source: AGHT+IEhm2UlrxnESPtEwBvMI/fgf4613dWJojNHjH0dA0YyQIoHXBBX22mwSMAlbcl6B7SrptBmaw==
X-Received: by 2002:a17:902:f552:b0:224:216e:332f with SMTP id d9443c01a7336-225931ad2bemr163943215ad.48.1741883081419;
        Thu, 13 Mar 2025 09:24:41 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbcba7sm15241975ad.173.2025.03.13.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:24:40 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:24:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
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
	akpm@linux-foundation.org, alistair@popple.id.au,
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
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z9MGxknjluvbX19w@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
 <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>

On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:
> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:

[...]

> >This is really a question of whether you expect odd or even parity as
> >the "true" value. I think that would depend on context, and we may not
> >reach a good consensus.
> >
> >I do agree that my brain would jump to "true is even, false is odd".
> >However, I also agree returning the value as 0 for even and 1 for odd
> >kind of made sense before, and updating this to be a bool and then
> >requiring to switch all the callers is a bit obnoxious...
> 
> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.

The x86 implementation will be "popcnt(val) & 1", right? So if we
choose to go with odd == false, we'll have to add an extra negation.
So because it's a purely conventional thing, let's just pick a simpler
one?

Compiler's builtin parity() returns 1 for odd.

Thanks,
Yury
