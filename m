Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505CBDDA9
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741377197; cv=none; b=sE9U/SYMzh9AWvCj96/0doLjMQsJZQ8B/KGhGzuxc1TtLZ26BwEIFNKLNtlZvJ/4tigRJCb+xgTBYWlgMlG9HL12bp8kyX+Ld3cYd7DYt7+a1sxAc3awDv7sNeJSoOnqAXqhj0QPF7jiFsqDsaJtbKTohg8kD9s/qHFoChCmfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741377197; c=relaxed/simple;
	bh=LNHS/O5qk8V3R4mU1dNCTKTGoEiRwLqi9UP8XhBs1YI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8pErDizUMC8DDxjx4Mvsk30Onu2iDjel45rHtk+6pc6bRX2miV+LlZwuDTt1NKiQlOm6zXzRd1SxKN2jgNWmZvaXSFW4QZEU1A96K1cpudV9C10PX0sceaP4PCucNfg8eAcwYLDAYG62ByyLSg6L4uEqz7lRwSzGQRa2IxEgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+JC0Saf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+JC0Saf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3911748893aso1588241f8f.3
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741377194; x=1741981994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFjCWoFVVseHqDKPyVju+l4iTZxEMM/BbzUS5g6rWQg=;
        b=M+JC0SafSoAArF8n39vKGQq9zWJwA/ZxDk3P/O+BBj2RkPB/QyMb7QdntgaPMl14Q4
         G7kmVASzzs+ddESZ8NRNQj6tw7lXg6SogLrvfbfcAKKLr9XHrhK/BVQmax5164KhkASw
         2UVfS0cnQrvVRTq7MAmMyajmNZKVTDEwpmV4o/N055I+8BdGP5ke96GVQOQAs3KlKaUT
         cxv6iHceIiCFobj3J60NNKAvqiWVqw8uFAZCLSg4aepglZP3MWlBEMISxg40eLLfLJEj
         KVSmUX2I92PLobh5xaoTJnvD3HF3ggTA3RApE7KtmGk/u42mnXfJNl5+QJPOTpI9pK8g
         DihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741377194; x=1741981994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFjCWoFVVseHqDKPyVju+l4iTZxEMM/BbzUS5g6rWQg=;
        b=xHGr7hCZKGYmVLBdp9m7zcbINNBxtR1r5uYu7mM8LA5xR696IbqljJh7jRpHYDcvqa
         qFm2vgrlfGqX621AYpvI4xBzwRE5Gobn9ELuSzqEtk9mAmHvXcWo7XpHwEXZ5AOSQYZb
         M7aLjJneO0AduTHgfQbtyjC96uxq6Rbmy5twez4bXUQgfDq4bAmZhKQBqETrICPrCz53
         zNGctVf5L7lc4DjkimCkBcyp0GrqZ8N8LOR9LpSE+uSyajM/zaM2YCCWnip4xf6HrSm4
         I63vfU/DK1pI0beZvbq7a3jR/RPaYb7FhARlWP+BsmyUPufiIDXQn9oviNaX9UWIjyAV
         R8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsOnSCBMq1fh48PR47Y+4eMO7O8MBJJ0JeMz8w9dfoXIYAJLQTCwvuajUH920jwAiHpTER1RzZh6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOS4KPYzWxXIBpIwbhrmgaTtDKoslr/5T1VMhkYqkjKPb8jvsz
	eOuC807z+L6+NMFDnigPeomJxeG5SfF0gIwnNSPLbDGhIEdUDcxy
X-Gm-Gg: ASbGnctRlJ1DaX/PQT/NZFr/zY0CTj5DGbFI6mNRtPig5e1evHZc5GzHDOQ6gYKNxxV
	TcI77hvmhi1MqNx6GK4vSKdekdcCbOWQcZ5+IEwk+KD2o11/hImQGFINQCdgHy2hbwf5LmoV/Ur
	DyQzUgNCt9UO+dyUCA7Zfz86TDTJw9pG1rr6QOp/2axBexpdLOw7p/zfaCLVu/+MhPExyIH0trr
	U/fyWn6OiIK/kbwxntPG+NxDGE7jRvjjfNySImM6RVgQnV4uTMEOSKtAUw3EhgDiMI/tY9t4HBR
	D1NL5rgkC3gd1itT108jI6TuhE8YgZ9x6t7gAic5V8cPOyHfQZxE0r6r6lYCaP+Nr3oDklMBitI
	EkNY8hEw=
X-Google-Smtp-Source: AGHT+IFtUYsYiNnYKhfvrcaN1ioOhGevW7gRyAbgDR19AZMXszweQZgGUKeQX4mOm4dqyM9BgE29Gg==
X-Received: by 2002:a05:6000:18ab:b0:391:122c:8aa with SMTP id ffacd0b85a97d-39132d96079mr3226538f8f.30.1741377194381;
        Fri, 07 Mar 2025 11:53:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01d2cdsm6394936f8f.57.2025.03.07.11.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:53:13 -0800 (PST)
Date: Fri, 7 Mar 2025 19:53:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com, arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de, bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl, jernej.skrabec@gmail.com,
 jirislaby@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 johannes@sipsolutions.net, jonas@kwiboo.se, jserv@ccns.ncku.edu.tw,
 kuba@kernel.org, linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
 louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com,
 visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64
 helper
Message-ID: <20250307195310.58abff8c@pumpkin>
In-Reply-To: <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
	<efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
	<5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 07 Mar 2025 11:30:35 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> (int)true most definitely is guaranteed to be 1.  
> >
> >That's not technically correct any more.
> >
> >GCC has introduced hardened bools that intentionally have bit patterns
> >other than 0 and 1.
> >
> >https://gcc.gnu.org/gcc-14/changes.html
> >
> >~Andrew  
> 
> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> for compiler-generated conversations that's still a given, or the manager isn't C
> or anything even remotely like it.
> 

The whole idea of 'bool' is pretty much broken by design.
The underlying problem is that values other than 'true' and 'false' can
always get into 'bool' variables.

Once that has happened it is all fubar.

Trying to sanitise a value with (say):
int f(bool v)
{
	return (int)v & 1;
}    
just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)

I really don't see how using (say) 0xaa and 0x55 helps.
What happens if the value is wrong? a trap or exception?, good luck recovering
from that.

	David
