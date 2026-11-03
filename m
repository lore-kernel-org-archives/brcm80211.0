Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714404;
	b=nefxJ9K67ccCKVfOWr0AXoj8BnLApJvbv7E7aYvnH8D0AhwAmqpFmig+qqxcDZ3uEIVk
	 rI+h9+E9aMyBhl0ar7S+FrJz3uBGl74VSQo2NVYeITrjVWw8AZ1L7hN9ledGB0a6q7NCe
	 2/DWZMser5GyEq2NeJPHvuuhARQArpUq+xRlrHb9rGEV/yZ4G5yB7IZaFQlGqWc0GB9/o
	 +7LkAWaJQvJN/yRl3NKwLZyNgYU/gKkN4jsrr5S8syhVJxrMKwznoP3vqGxWgsTDzuzNW
	 VSOwn7Q87ACkm5di7NLyjsmapeX+PmDml+yvPvgWS8Us3MXWHaanYAcdOo3Hwc/9VHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
	b=rk8M/Ln4/88RduahRnFSJRGKV42cE7tnvbPgTqYyhfLu5mg2TnDSUdmz5LwBA7YEshJM
	 XHvCuE/CD+lcxERkN58chZ8AIMRqzChjS5DbswTmzNdPgSy/Z5nKqLPxlR7okQKcnJRSl
	 1fwnJW4fKzC7GAt978HDutmsBKaeCWNwLnAgFy65m4ivc9yIIJYUXRhyqe13ZESF5zpLD
	 2LOcBo/ncFm8x96I4pGrDaywadQIQoBhPj24ruGAUpSTnBTLJ6Bj9mNyV4GHMKhAsDgoE
	 AESXb9XIZl5kH/No73rGM2oaWhRK8u79zJXm7VoONmYItJsLvisFoM5QGvJnOhnmGbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WYcMd6rJ;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CD60850B9
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 14:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 046CD60850B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WYcMd6rJ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so3284350a91.2
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 06:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714403; x=1794319203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
        b=opqc5ZJ0fMBpfyB8UmKSXiVHoyoXYuW6wEGaF0S4HGBT7wS7kIXMZqT+/2YGD7+Aaa
         AXUTE0iDYfiqCHMgfIBjeTTPm1V6QLJOsbKWkeIwWYOCuI0ZcFhecOQcvxheH2UBg0FJ
         bETNjcd9K0fYmbtw/Od4shFU98KAc5vCrtffhtO1f+7jJU/K69Bgb+sKvzfxQ5SXs6+Z
         Qk/elFCVWsgl+jYnsB/MZTmBy/ayUBjX0Kn0UGi9copXZGYaEO2xRXCFiayKRg/Fdh1g
         Ed8gLnUNGoyCGuU6rmkb1yTC54oaEyrF6M3sJ7l5xp3BVgddlgW1o4YmeNGCXQONxDiU
         dwFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdDSdPnBR2DpwqOHaZevdgggLJPFPBXs5G3+gtoaB6VhKl1sMpW7boIbRevG3XNWNWQDX/fb6iD6s=@lists.linux.dev
X-Gm-Message-State: APuU4Z89fXKiZbhuNxzYfsF2udH7eP8PnBdKzxXeWXIMYZl/quzguN2N
	m0P2PfRWh9HwNxQgvgY+C3uWN32mCg6YEZYMFSnNvJ4rDhhMRibmXd2wclSn8JQn9zG9OBAb/Mv
	3tZV035v+7lQTJULa974qk9fmb32yfN51mw+4/4YusfLPfJl48LahINFGDa3CYycnT2ZAIgt7f7
	hlrGtkVhpf0789goYK2IxaI6y43R1qq7yP7q0QM1JqPsZeFcPokTK5lZbEjr7kizCwFXIvp2hqR
	hXOKL9fKnnmtMftV5W/aw==
X-Gm-Gg: AYBFou0ixzP3bdlKsNbNzn4S4yaC5FpULyDzYA9zozvB/7E9iAV6eBUQtgJUM3ANG5G
	ZKvmgz4vtYxwwCnZfQItoVROpbrfQlEySpHjMmGDQuTb8PhYdn16YMdgoJHOk3Id3+eIw+J1MfM
	jd3dHd27E46UYqENMmQgcVU+3LjR+kZgksnxAwXK/clTp771EM/qwba6lz+jbgsO6SiWWDingZi
	RhRZAxEnIzJdkmlw/AUzow4U3CJ9ts0psFP8B/OYoAnySudPfcALidKz5/hGDYAvuDCtZ/r6pw5
	Jz/QV2DPs5n9XJXsY/+okmd9WUSeIX4XHB72D8UiYw43RBhsq50AYJDRHjloQrYBo+4pbW07hgW
	2CuFbsArMYgokeYF8ezVSk7r1iR9QRuFbimB/HeBxZSAx8UYaGEEOgGDGD/+z/ZrWlmtnhDXguG
	jzq4TvH6ZLvZ8+dbZmva4tyDb4e57muJFnhpSl3oY=
X-Received: by 2002:a17:90b:4a84:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ae897ea4admr9907911a91.18.1793714403151;
        Tue, 03 Nov 2026 06:00:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0872a3207sm884630a91.8.2026.11.03.06.00.02
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:00:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ac19c6bc71so3070561c88.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714401; x=1794319201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
        b=WYcMd6rJ/lXVWzIWLcr7DWz//nOkdO57W0gkpbkKb+oo7Qvi6nN15Gyee5peSNIVz0
         nIx3f2i3VEehRvqyWdOQvXYvPy1/DPMlMeVmS6flRcW9cfro8QK+6y6XNXyoFYVqc+8G
         d2omBSAz4ewlXtg5BFKm9PREOqIW69hduTo60=
X-Forwarded-Encrypted: i=1; AKwUvBzquPoyUzCTH/6rBiwNwv2GTkZbN81YsA742CgNR+0livtaW70l3knNHohtp6bXnYL0aCrxLGTjlLs=@lists.linux.dev
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr14495782c88.23.1793714401174;
        Tue, 03 Nov 2026 06:00:01 -0800 (PST)
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr14495751c88.23.1793714400382;
        Tue, 03 Nov 2026 06:00:00 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:59 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 12/13] wifi: brcmfmac: Handle extended PMK command payloads
Date: Tue,  3 Nov 2026 14:58:56 +0100
Message-ID: <20261103135856.3676311-13-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-12-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-12-b5cbc2cde2fb@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:47 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> Some firmware rejects the legacy BRCMF_C_SET_WSEC_PMK payload despite
> advertising firmware supplicant support.
>
> Add the extended PMK layout. Try the legacy payload first when the key
> fits, and retry with the extended layout only after -EBADE. Use the
> extended layout directly for larger keys and reject keys that exceed its
> capacity.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 39 ++++++++++++++++------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 18 ++++++++++
>  2 files changed, 46 insertions(+), 11 deletions(-)
