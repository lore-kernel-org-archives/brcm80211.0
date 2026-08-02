Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F123909B5
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659958; cv=none; b=Pzyab2Mcq9S/XRuamY8cYd1T0kSljtqx7PxH93Dlws7tMnaXXRBieeIHZmr1zPhBTIN8CsFZUpgDD7xmIJVKyhpi+iAHvr4mZTBihrWHl0u6YmjmkFWHS58NZO7VHXhxRFJ8WJsUryB3GEK3EEISzuT0NVozdEWy3X7YNXHXuzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659958; c=relaxed/simple;
	bh=qBzJRPSIwfkZH2tMi/hPWOxxUFCnhOzk5IKDuNq0wkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBgs2iG54p3rhaGPfeIU7r989HCyyh04T4J7JsXb479av6bqJF22mQjPMus0WAbAAVk53S9wySz6bjfypibLEchSZf5Lygoz4aBEigeobY5ME3XpgXv3eP7Sg6jo4e6zzPGu4j8iH8Io+fApFxn9PnzTRT9PJ2ZTA/G1QbK/zm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fZohea19; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fZohea19"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-902f92b8504so13428046d6.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659956; x=1786264756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+VjNc7Cj5tMz12o6jEVSiidd0PWIOvTtdYHTchu4Pc=;
        b=JdOMT5uDNgIxWyc3wXD/9U9GX1ijx+q6MMRvvtMpv8rm2dYEaEIcj9O5ZsEjwRKiTz
         8AY5+mtfAxPu7rJBKLU7Tdi7UBpdigZLRbXAzE7qGuuP2JwTr+m0h5ePN2sXPHOjryG2
         MD7JMXwZFRNcYS+NGAvQ0o2IfEoOjlqYG0h89NS4wdCd18dcaB2/Z6mAPfftzN3E0Jxx
         kJrel4leo6DSy7izftyIimSrDAMatgHdDCmYxKNUmnn+/nltTXjjXCPsC8KyzWcXUw1y
         xpKPN9CDi9PgHkM3Y030C3tulB65V5CzCOMLT7fJyBjn+wLubUhLbfFiNtjMnQWg0M+q
         LTkw==
X-Forwarded-Encrypted: i=1; AHgh+RpakLB0ev9YNagcSoxyTn7xLN5v8hgEhSzHn0SmyUcVY+k+u9x84VLnl7IIWv2dC2icyD0WzV3O6Mg=@lists.linux.dev
X-Gm-Message-State: AOJu0YywAruF++2LZNPGC4BO6nklChZsp3/xbsgd9aPbc5f3BHeag1on
	raOWXDyX82rj3xp3cBLf8aB/EAv0LXWT+iyM4yQhTISlQwEhoEQm/HaZ6wcIqYCQudPhjsNX4vo
	woMchPSJclJndgwxX5qEOcqHoRS9sZi0PUWKyIIltMYLty6tuCmxDUvPsjDo10xIqTbiTbs6dF4
	Iz5sTbU+bQkSyjRUDB/9Q+Q1lHjxJuCE0KszpiyBfmS9jHEsd7+juMeWVnWVu0x0qucbryPLw1/
	Qm5wu/2OmzhMnhu0HmhzQ==
X-Gm-Gg: AR+sD10VCqJcDeopx0JE95iXkT/Y2keWuHki1f9JwTSts/fOgZFYUK6s7l2fsfPDce/
	JCovaEiqTxzADQ/X+TxRYp6pRdwXMNehU1oBY5f6kesOmDHWHyxPPD1ycGyv5smgp7fjrN+WMh0
	FfBFsSNNtXloulzWUafQHfW/ky7jf6Jlk/gvFC3ySbjZmKK+LbWx1HLtbbzayQ5sepZi3PXu1i5
	gRnq5rTSWcE+VOfY8DGqfrCFlertmT+79cOFZMFd6NQ3pOzHDw3QFfYrWJJFDLjgACQhzZYoO8+
	OLeNoUctSWu69gzHu5QOIeWCoLX33NcWNjvi1vNT6T2b096GRrV8bFLKsg0tqhSolHYlx6BPJur
	DepF/HBiS5UGrvr9kbdS+V5JueNX/p+uSrXrWZcNP6PDhOffxyAuKeT9t7sR6qXXuFWbrUV2OTj
	L5XjH+K/7pXuZDK3I4CL/vdEU0ONNbh0vYS3f78co=
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id 6a1803df08f44-90849603117mr95801126d6.18.1785659955569;
        Sun, 02 Aug 2026 01:39:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-908435f40fbsm4775426d6.24.2026.08.02.01.39.15
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so23997746d6.0
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659955; x=1786264755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+VjNc7Cj5tMz12o6jEVSiidd0PWIOvTtdYHTchu4Pc=;
        b=fZohea19JCjZuQmfArIzKOHmhC8xMKjQu7hisXCuqfFU4Yy6E6Q0L0LtlUsOJBocwH
         uUB9ameJ2bKk7SHmm961wPHlS9GY7GXY2G112ipsJXSjJrNcecaAfuyDXRfyhlYuriQZ
         90+7L4Lv/GzuN2WhEkfyxqtc2lk5t9iTKwdgU=
X-Forwarded-Encrypted: i=1; AHgh+RoESahlp7/FK5/2Qio2cCewyzRfmq1yQwdoEN0iTv84mAWpebd83QKFld9Xiy3h4AWXSdp8Av+Dgdo=@lists.linux.dev
X-Received: by 2002:a05:6214:5b06:b0:8f6:2588:778a with SMTP id 6a1803df08f44-90849558b55mr131975826d6.4.1785659954744;
        Sun, 02 Aug 2026 01:39:14 -0700 (PDT)
X-Received: by 2002:a05:6214:5b06:b0:8f6:2588:778a with SMTP id 6a1803df08f44-90849558b55mr131975596d6.4.1785659954328;
        Sun, 02 Aug 2026 01:39:14 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:12 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Can Peng <pengcan@kylinos.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: validate msgbuf flowring IDs before use
Date: Sun,  2 Aug 2026 10:39:00 +0200
Message-ID: <20260802083905.3819981-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723055618.550834-1-pengcan@kylinos.cn>
References: <20260723055618.550834-1-pengcan@kylinos.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 23 Jul 2026 13:56:17 +0800, Can Peng <pengcan@kylinos.cn> wrote:
> Firmware messages carry flow_ring_id values which brcmfmac converts
> to an internal flowid by subtracting
> BRCMF_H2D_MSGRING_FLOWRING_IDSTART. The resulting value is used as
> a bit index in txstatus_done_map and as an array index into
> msgbuf->flowrings and the flowring state.
>
> Validate the firmware supplied flow_ring_id before using it. This
> prevents flow_ring_id values below BRCMF_H2D_MSGRING_FLOWRING_IDSTART
> from underflowing and rejects values outside msgbuf->max_flowrings.
>
> In the tx status path, complete the packet with an error after
> removing a valid packet id so the skb is not leaked when the flow
> ring id is invalid.
>
> Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 46 +++++++++++++++++++---
>  1 file changed, 40 insertions(+), 6 deletions(-)

One nit: there is a double blank line between brcmf_msgbuf_get_flowid()
and brcmf_msgbuf_dequeue_work() in the resulting code. This comes from
the pre-existing double blank line that was between
brcmf_msgbuf_remove_flowring() and brcmf_msgbuf_dequeue_work() -- worth
cleaning up to a single blank line.

Minor enough that I will take care of it while applying if you do not
send a v2.

To be applied to wireless tree.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
