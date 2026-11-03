Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714368;
	b=iKp/NDeQ0HOoQatmo0tJm5Zf/Dx/dWDDwxlnUPovLk0c3FRP+kQFOgqzCnxKIN5L9xdC
	 glTRB6WRxvESoptMAZur5QVwGvb3Sj1F/UUdyzs/ffW0b+mZyWrwW6iQGX+uZYS0hkHnp
	 0XYM9OG/+I/VutQFPue/v6uR2W+bc8gzbaxib+43AM5yi07jxX8h+iOnNJiore59Y+Ceq
	 vGxsC1llQx4C1L185QJvEIeB8jIE2Uvh4PjsPeZkvmR5qfYWep1UoZf9sbpruvKbNRfhs
	 5VJNNGQVU5KfkMr3bcTSspSH+/ERKm6+ydVBgdIhQ7a0X44gV87ww2fdC6YsOeOjCZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714368;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
	b=5Nb9IUm3ZTeqdKGU5B2Qpmb5bInGcIMRzlJSuwcRxHguevJcyG6Gw434Wy51Vg4iN7Ix
	 ckRc1wfKQp2cZSZzwSSMRVaGbGdKTQ/OKoQSAJCbRWW2EugZp1o5pbRPcvB1gvpB+2k85
	 QTtl//9dBI/x3+6+TmJiAmewIisjsiY/0k0mAnidvOjOfF9qeyfJrtrgwQz7rbV5+gOnx
	 JoW1xHzNXzv12suwcL/n5lerz/iKZ+1Gc3i8CwuD2Ha0xv3m9smxtXvtUkQt3m22g6cOe
	 jgsR/jiLSY3Z3xf6uSSS+Mx2pc9ud8yRAcrMqFpfStEJB15n/bWCCVS+wFpIdM6smRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Nwd7Dvy2;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735A606D81E
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C735A606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Nwd7Dvy2
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-53e1d40628eso9472641cf.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714367; x=1794319167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
        b=p5NvmzXHwJ/5SPMk7nOBGtXQBufAJmxfiwZFQNOjR4hTTtS10z8xYXeAVE2OiQJExz
         e+p08N4nqAcnK13PyNa1ukErKetMrV198kz1cviRY8BXzhJGzDKhZuJP59e5n8DNlZ4N
         UtXOxb8Lcp4xkizBh2AVsy3fcQeABwFeKWoJ6FmNpCSh/ejMjdDOgiCiEoVxK3bSe6Ag
         HiSrAUE2uEP65MiVGC3+O2nCWlMhYbfec4Pw8PE7DeOHYt3C1icSwLpHTMmsw+75aWcY
         HZV0LDgoia+WkzwftpDWKoaCsh9cbrVEtLvMz0XcG3BuHk8HWsFhQokfoSqs5uhtjvah
         vuCA==
X-Forwarded-Encrypted: i=1; AKwUvBxwNfCrGBqBD9FBvBOsmyBNYCIig/Gc7J9p3J8nnjK9j6Lh6um8s56hTWl6hdPjhLdGYn0/fw4Kz9Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z/xYzDzp7+8f7aGwdIR/vrh81vVDRH/IWro8qDe73G6TJAluypU
	frr8EXUDF7M6XcRlg5u1TxolxMoQRi0oSafQ05wu/SLpds9E4fm6Gr/519cfrROgkljTzTP0ae+
	jv7zIwTEtmeZuX8FxMokWp6h9e38I4V+62pIOG0hF3b5o32hkykAxjt2qCs9EczmfmcAtMUjwh1
	Wjaqo/qV0DQnXDS1Us68MokK2q8B8pGwFOMPTThO8QHF5XWuJPAB52x1j9iFA8GV3OtE3xeRCzL
	57KPhHpLifdHiPRvvDeYQ==
X-Gm-Gg: AYBFou0K4PMpl1H1o1jqeva60chzmF7AuuLe+kKt7EbuvnfEwGQ4tbbc3MZqnEGCCun
	IL3ps1vsoNviGacdT9FUOSclGDjdacxyDrn0gVXTbsUuMJJGpvsZSp2w0tv2t6Zrag+ThWnyzg6
	llidByq/TY67S5C7UPGlQlI9IFRFkP8/WlAwwLcQvoutnP8ty/k8PvUNnP97J4EvDlyJrfWz7ZJ
	IKVEnKgUUvOB3aSZfjvsz1090v71AZWv0ycnR4ZsJkgN5zIgmDZGDS8HJaij2Geg0IwINx1+mqm
	3bIz6+v4Su7O3FMO+G3ZAo8CPF7pB5+WY51TWj+Zta0QwuxmtqJI58jU5S5A4nZNy8SZLCHuUwN
	UWkQ0J7+7SHkzb7YR+YQn4O0efLNmpWJrNCY21NVsQzYEdmZ3edH53QyNwcRloc+YoVKf1btR5C
	OZKid489Cf0Rj7gJZfXc9nRhIcDuvuQGgwUQsRtj8=
X-Received: by 2002:a05:622a:2516:b0:535:1cee:dc42 with SMTP id d75a77b69052e-542b6973614mr194907241cf.7.1793714366658;
        Tue, 03 Nov 2026 05:59:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5498bf8b2f3sm299101cf.24.2026.11.03.05.59.25
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a26fe9521so770220eec.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714365; x=1794319165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
        b=Nwd7Dvy23QUQksbTHroYKneURncjQQ5cbnNJuD9hlVF6xgIjQ1yPOVfNE+QXYRN1Ze
         /af5ES7m1EHJf40tdc2QjdqJupahiP6ZS5HjcwvoDaVBi+VaU3+2IRsZ6TFdfG+ByUdQ
         WlD6b7AkvC+kz9pUxsu//xbUcthqG5G2rTwm0=
X-Forwarded-Encrypted: i=1; AKwUvBwpDk9nODo7babwfWmLFcrlxWMEcvhgRv+wzLEvJXIZF/EQUzrOZX/PEvk894wLHQYKEXWfbIK86LA=@lists.linux.dev
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16236306c88.13.1793714364470;
        Tue, 03 Nov 2026 05:59:24 -0800 (PST)
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16236255c88.13.1793714363382;
        Tue, 03 Nov 2026 05:59:23 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:22 -0800 (PST)
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
Subject: Re: [PATCH 08/13] wifi: brcmfmac: Handle larger firmware band lists
Date: Tue,  3 Nov 2026 14:58:48 +0100
Message-ID: <20261103135856.3676311-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-8-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-8-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:43 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> Some firmware returns more than two entries from BRCMF_C_GET_BANDLIST.
> The fixed two-band response buffer cannot accommodate these lists.
>
> Use a larger bounded buffer and register only the 2.4 GHz and 5 GHz
> bands handled by this driver path. Ignore duplicate or unknown entries
> so they do not prevent wiphy setup. Skip unsupported bands in chanspec
> lists and scan results before decoding channels.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 48 +++++++++++++++++++---
>  1 file changed, 43 insertions(+), 5 deletions(-)
