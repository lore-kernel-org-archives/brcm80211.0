Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B12857FA
	for <brcm80211@lists.linux.dev>; Sat,  8 Aug 2026 00:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786147225; cv=pass; b=ULRuxINtZL0RNZ3PDgH/e2P5SYkEYXEIzxIhQaeA60a5E/UjBPCpjgnXLjea1dOOa0HsL+AzpMy6sPBiwp6qgPVuk/azv0PSVuBmBUGoiTz/xKZ9YM7AyIKhl2kVmXzKcuY8f90WpyA3Iv0nGUDxkd67zG6uMq6aaz7yBx0OpjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786147225; c=relaxed/simple;
	bh=UdR7ZTFIL3V+BnNVq1UDIT4zKuWlbCjD0STBKjhwyC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TN4//9ldvZybLb74z66Js93p8zJYsZEbvRcHg4EmR4653jWI+wMcWpOMkYsDMGQiyMv4gzD3sBaPLMfsq10IUVjY2IdC/5cPQB0JTWu7IYxudRCv5jaiCEt/0YD4NxYYOR6Yvazh1lnTlG75/bAUzt4s5kYWn4/Mhvc6qlCNng4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyTrEHfu; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyTrEHfu"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a18af264f9so11814a12.0
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 17:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786147221; cv=none;
        d=google.com; s=arc-20260327;
        b=j1j9cUVfRnvnSDzeK6oIlJU2cIKA7waTLXjfr5Cysd+2nOBvR+9h7PevHxmQnW/9aJ
         MJ9Ci+bockntxD7aDx57TInxVBj/60lvnfzjNNHEKbg29rASP5rErRKfvpNoI9iD08XB
         1fXkngegISR0H4wId+ZrxbluxF9jycT4hOlF7sbsB4LEAIUt3WGJvo4cxi4uRgSGmNEX
         4W0Cn405qyMNkiEYRXZZP+ozEIL4DQGwWFTcl9h2/mBpIPXyUjAUiAmZdFSwkbIV3KoL
         +APvBzvg9Y9WfvXD6aaZ/NdoM0MADAMFQnIjYXbl85jHHfvCKloRV1rNOaUOuJ3mKnO2
         2OJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8ZBSWIPrWKHHCg3jurXTVoAiywt7j3Be5iKukh07Cs=;
        fh=xjpwar9haX6lnqmnoAUNHR7rKGvulgdDtdDO327an1o=;
        b=RiI7bdpxoBAur4J+VYwOjP1ryaQn0N3SEOqO+Re1k3md2iXvUgGNPtRWsgVYCCwWp+
         lt9Y55fuVo8mQr4pdKi0UcUBgzqy+YY/rUjIBd1705d+9g2Jch//j7O7Ojat7XwCjaKI
         FnIyyENL+UjSrujNH7a2+OyVZftvVk3Qag53mMjo5aCw/KoFlfA3/PNe61BTs6ExZIXZ
         WYbCnFcp86CNtG31/IUwgSPv4VGsSEcZtZkX5zLKj/C41DyPMRbHni9WwrVF6LKdjXic
         hn/EL4CeU0GC0VKBU5sGcXDtX9Pk+dzC2TzkqHnr7Wp3tk+KIZzmMljDGZgLDN61x26o
         4arA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786147221; x=1786752021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8ZBSWIPrWKHHCg3jurXTVoAiywt7j3Be5iKukh07Cs=;
        b=iyTrEHfuk88yxAOrlTVK0r1NuJ+Qi5uYeKigk/s65kmI8Vj4AUGvWGUS2gc4zcV0ij
         tJ+2b5TTiLKVrPvbNa1rDcN9phtSR857kEd0Yo2qWFQzhQjlmOs2MnOXrhD+2rR4fOMC
         IzjF+cPbrZw+QmvANnraSIgw54+nK6M6XWSMJpntdoo2BdxITwzfASAzKtqCpNU1P3xV
         usFlIUrhIA5oWTtYkASG/r0kXpegnJg2T7mjgBhlMy9gQ9Krsrh6SSBi87f4pTFjE/oR
         gSUc4sLlsM9m9tsv41NmtSRom+NlJw5vveni2/8IwXQ1gMRY5Dl/Bx2HL6gDGgX2hli3
         3Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786147221; x=1786752021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8ZBSWIPrWKHHCg3jurXTVoAiywt7j3Be5iKukh07Cs=;
        b=Q5DJYffSBLoZ1a1skgRWuv2eMiAQH36bDYog9xuhnwttK9gQFQ1N93GXRhSLB2UnmH
         T6XLj0zcxL4sRfE/fbBuK3g3k6dX8tS5RmgzP2FhvhnGGr3bQWbTPFeuxmDcmuZlCQu8
         Nrw5SBFanic1qt0M0b3kPlK/FLdrFUAjU1Cxptlwd0r2EgPF8ykI9ffGWuWEpBREFexv
         7Cv0Erj+/bLk19rbXlrMaTUTtrNpHyBKCPw32ft+1jkkaCNG6TmXB4NLxgHkmdzKo5oG
         EGjdWXxPxwCywtS5ZqH2DLqLspyFXY3HUhP8fcYC6cKRDMB5pGWcyWnlLPGn79C4JJzg
         4OhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIzH//OH2+tsIU8DZfvA90KJcwc3I1h8gTr4x/YHG+Xcjo4X4hVC5HNS+0p3SiHpQEq+HtlGkIHBo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk+40me5jw7jqmuKZKEUyia6grqYRKWxIVvQdhmAYBXq2yerJC
	A1qxVjnuwDnKXnNTJB4kNRSzhdcyObbJzKta6+694JI522c1IOSPzTorUYftJVr8WYYhJ5HVJIm
	wmE2o0oVBreTLtnz32mokNPf5Q38k4Xw=
X-Gm-Gg: AR+sD13cQt9Sd8YHQRfhubWyx5fjucN1C+wgyMTiBahnGBRPOJl/loxDkkvPTWF3m3f
	5ftkL25N6IGFXuZMD3AnLhSceIhdesREiU9wlOoAZ6WMu+4Otyjh1MAgxuWi4v7fpajQ9P4Yi8D
	jfwSio5NhypXR8zohEJqJNhZkkJVN/XTOtkQcq8+Zwzmt8Pd5G2HfaFBKULye6jRZyoPouSyUo9
	uYgQSxMzOsZ3qrINmW/GpoIA9IsUgr6IVfB48/r+zuvu0oydbRzdAPM4y3JH+EEkmxuMA6RfHgp
	tMVxW+7uh6pSW026zO3RMfw3k7d4Sv2bZhrb3MNnV1yFcY5yl57NW5X5AaRcwGq4sEl1/S9RLZ2
	8/D8OgC6oR9g5CHCBcSvwR6bWfbAnvXuLMOTua+irF08=
X-Received: by 2002:a05:6402:28cb:b0:6a1:445f:1f3 with SMTP id
 4fb4d7f45d1cf-6a14f28502cmr6315290a12.4.1786147221307; Fri, 07 Aug 2026
 17:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com> <20260802083905.3819981-8-arend.vanspriel@broadcom.com>
In-Reply-To: <20260802083905.3819981-8-arend.vanspriel@broadcom.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Fri, 7 Aug 2026 18:56:26 -0500
X-Gm-Features: AUfX_mzX12CQEWUDSZdNypV-f9oJzIXa5Pzlcmj9Okz8ULUQ91VkoAyJ9BvBYCo
Message-ID: <CA+ORkNSS1dOdUK51B0Q1r2Htc5NpP-=EmE4FO6=4rX5CUU_FpA@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gokul (representing Infineon) promised he would send a patch a while back.
This would be a preferred solution as it comes directly from the vendor.
But it also takes time. I can send a revised patch next week.

Regards,
Bogdan

On Sun, Aug 2, 2026 at 3:39=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Wed, 29 Jul 2026 00:34:08 -0500, Bogdan Nicolae wrote:
> > When bringing up a WPA3-SAE SoftAP with external (user space) SAE, the
> > driver never told the firmware which SAE Password Element (PWE) method =
to
> > accept. The firmware was observed to corrupt its heap over time due to
> > this omission, leading to firmware trap (data abort in heap allocator).
> >
> > Parse the beacon IEs on start_ap() and set the extsae_pwe iovar
> > accordingly: 2 when the RSNX IE advertises H2E, 1 when an H2E-only
> > membership selector is present, 0 otherwise. This matches the behaviour
> > of the upstream/vendor driver and only applies to SAE-capable APs when
> > external SAE is supported.
> >
> > Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> > ---
> >  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 75 +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
>
> As discussed the extsae_pwe iovar is vendor specific so the fix needs to
> be gated on the CYW vendor. The cleanest approach would be to add a fwvid
> hook (following the pattern of set_sae_password in brcmfmac/cyw/) so
> brcmf_parse_configure_sae_pwe() is only invoked for CYW chipsets.
>
> [...]
>
> > +#define BSS_MEMBERSHIP_SELECTOR_SAE_H2E_ONLY 123
>
> This is already defined as BSS_MEMBERSHIP_SELECTOR_SAE_H2E in
> <linux/ieee80211.h>. Please reuse the existing constant.
>
> [...]
>
> Regards,
> Arend
