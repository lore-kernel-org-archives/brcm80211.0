Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539223D8900
	for <brcm80211@lists.linux.dev>; Fri,  4 Sep 2026 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528255; cv=none; b=IJ36ACxLi506uLi2sndPVm9IEDtOjVHzkSoNbvROH7Fmf+FTZFN6AV7KoTSh/EKgctTntXObkMaKAbK5MQv57XYJEY5FJCc0fO5xSuU3E1XlRWxCNLE0lE0homHrDub2CtT4wNsnsg3Pf+EehUqPdm2l04q0jfhkoNCWHlvoHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528255; c=relaxed/simple;
	bh=rY/FD17a7G/eWAVvA7Y9WrbqEygpxDfhs21tRyAeJRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL2iWGrORvWdGYBWcdo8a4WLQu5vEajKCJQF521nT9L+GrQBh9JEmeiLPQ2waUrKc9SJVVmOIliTvuxW7JH7U1qzZU+NpMlLAyJl5P0TxQzGPbjRwfH8jL/duJsmJ+5VlzQb1gRm74e0T4Vl49Jpbpwfn6xsg/nIbByLQz6LsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=D42++nMj; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="D42++nMj"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38759bcd877so930973a91.2
        for <brcm80211@lists.linux.dev>; Fri, 04 Sep 2026 06:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528254; x=1789133054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gKnbVJWEFk/CLsBUPWolgt07xLoRfVm3ryFkAF5KIOk=;
        b=Pe/cfuSTuejF7jUKmhX3ojUIIXLxuWSGgPAb5jaHzat3bMr9s2zUZkSfdVw6ZIErrX
         +Fm8SRq5nFI1MD2lIrMlpqJxflfwQ42gmaMLrWG2OBffmKqFOJxbgkbxw91ElZlUaPsL
         S4HNnKDHdZcIguTxnGM0f1fi5CCKiM0rf5ahcH0PvwJI5PINs5zeFGLFW6GgPscGAJwj
         T7gwIdxCm8TmVQjUoZsZm5+fOI/acdo6fn5Eg+L9KWDgitoLGqpT79THODI84W5dtDpl
         5E5RO6X/Q/qdx7jLgMD6pgKH/T1leW/iFXzGhTcWfY84v6ROnuFd+aP5w8AB6ODUVgnb
         JGXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFZjAy7g8rD+ja1wzY1HfNQQK1WNlZub3RAQbYEBgJekfAG7k+cUNislHGkhr9JzqnS3Aq88q/ijI=@lists.linux.dev
X-Gm-Message-State: AFuF++khroIUt1TqdRjU13434gBPVmDVaOiHAR6HUcjyDJJkn4ROcANc
	yGC1eS1APeNy47aLDskKIsabOVR9rvt2btTV9ZLtuCmC0EUFO4CGcJB+IfJKNrxdsk3feNMnAT7
	jNJ72mQRUIkgNOrJ2BgORXu/cDHyYC9K3xgLTfmF95/CSvCGfFwAIhidlPr3XYO/rPCXuWIK4tq
	nIzjmIx6JH89lvbEq/ZM/1IDxBymai9DDTkFqieJ9gF7gIgtM4IyO6HG9QSIAsg5s46eEv2EydG
	bABP7oOk+lQgKvm9n82Vw==
X-Gm-Gg: AYBFou1slFn1GQGA4RaUWUxPTZ3b+fT0oXwNW3U2J+CkYEAyvvKtgXhD8AOD1r063oh
	mxmNeTDtjOCcg7XY98GcKx/V/BIDgUXVYuhZugyvaDAbgqPjUIb3OjC4Tnbu0M/0F9Ppw2o0Mdd
	RAXYI1h93Wjm14XVvMPxN3G+xRXPzv2NDNQMrvZp0PNWKbC9kGZbeR2ouNEt5cAsltkv4WakS5I
	g1JarRfI7/Wyiw8dZ8vrAz/cTaiecGerxH7SzbFNCBaR6nmSaalkWY9o/J93GTt+hJ99dj6AW21
	fwdv+Owf5mycvnyPMg96qTcXYA1ftoOwEfw8bXfRUdlLdgfmMjVrrcxnk/uYgupUEayAc4jRWlX
	NJSqfszrlRhr4hti9m13nM+wFGvD3xJylsBIQUeBDGhz0asJpNqSQj5jCCAeR3zNAiwGVqFatmk
	seQZLZ4EHtvT8NIrKCVm2EB8PP7iQuqN7GYfs0TFQA8A==
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr8155565a91.4.1788528253709;
        Fri, 04 Sep 2026 06:24:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39ae8f1c0e4sm854181a91.3.2026.09.04.06.24.13
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:24:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903982af1so227322085a.3
        for <brcm80211@lists.linux.dev>; Fri, 04 Sep 2026 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788528252; x=1789133052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKnbVJWEFk/CLsBUPWolgt07xLoRfVm3ryFkAF5KIOk=;
        b=D42++nMj/+zZxWQCWrsF2dMTl6/g/s3w29YNlmaJCZFa3DWV4fmWEOYv7WROqjjt2S
         aHjJGS+RFb6lnkJozMgqeK5iFQiALjNyai5Rr6lJgj6ZLvRTbmAlUEQBcc6sX27AyV0A
         9PTzZObYgKHUmz2rTkkhILh8mgSdsSsROwA20=
X-Forwarded-Encrypted: i=1; AKwUvBxxg2aZ8UmEAkjQKKcj+U0G/Ir3gJFOuEytCwZnIlx1PGxZqx215BrZYUHu19i3zMy+LbiLg+VU2uk=@lists.linux.dev
X-Received: by 2002:a05:620a:d95:b0:936:bc40:cae2 with SMTP id af79cd13be357-9398072a8c0mr585324685a.39.1788528252106;
        Fri, 04 Sep 2026 06:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:936:bc40:cae2 with SMTP id af79cd13be357-9398072a8c0mr585318485a.39.1788528251581;
        Fri, 04 Sep 2026 06:24:11 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb33619sm210778485a.22.2026.09.04.06.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:24:11 -0700 (PDT)
Message-ID: <6e946b7c-50f1-47e4-9073-1dcee4f141a7@broadcom.com>
Date: Fri, 4 Sep 2026 15:24:04 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Michael Buesch <m@bues.ch>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 b43-dev@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, libertas-dev@lists.infradead.org
References: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/09/2026 14:43, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

For the spelling corrections in brcmfmac...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/net/wireless/ath/ar5523/ar5523_hw.h               | 2 +-
>   drivers/net/wireless/ath/ath.h                            | 2 +-
>   drivers/net/wireless/ath/ath5k/dma.c                      | 2 +-
>   drivers/net/wireless/ath/ath5k/pcu.c                      | 2 +-
>   drivers/net/wireless/ath/carl9170/fwcmd.h                 | 2 +-
>   drivers/net/wireless/ath/carl9170/main.c                  | 8 ++++----
>   drivers/net/wireless/broadcom/b43/b43.h                   | 8 ++++----
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcdc.c   | 2 +-
>   .../net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h   | 2 +-
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c   | 2 +-
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c    | 4 ++--
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c   | 4 ++--
