Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714362;
	b=CObFtJC+XYDkvRQ5vAElb3lExBEw6zJbisRBXgAgVAUl303nuBslB/Lb9L2KiM7KEKga
	 EbP+aM6j2NSy58vytc49cQebcf5le/H03GSKaNKeE3NGMr6WeipCVt8a9Q+GqnDLo/L5K
	 SKuuBS3TzO+8J5n03NduFwjjgVfBWS/dbcQeCsSKkFpbE9tY+cgG+UACY9LyqcKZ8h2p2
	 nhTIiAHDXjrV/anDarwpzwQE9GYeKdZ6hSG/tazPD5Qn27+t7q31rr5CMvvcXMKFJNhQz
	 +PcWKXBLRaltjaeJHaDhqmvCMsaOuUg2SshIFZiEJgbpRPPb9Alkl/zFSFvsMNZ4quw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714362;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
	b=4IfjvfspQrnkJumQDWG4a5tbvJ9+a53Ol0+dICrxwgL2LnLrcjTNLIWXDkuvjpl6l9ca
	 2aTOm9v/xeecIV5eE+2ZBbDhWhWyeoDn0zjp40EkrmB5EFrgSghpgYM8zA3AIZcWKI62d
	 EfT2bQVxvo43dHA2JbbSBSMuNa2zHC3roa03FWTi2cIOZfwk978ElgH2Be1ceCTvgDsaW
	 zhadjINMx9px+SQEPNb3IXeGgN4NKxPpYuSJwAGvRF6j9IXbjyKaZFtSVA2R4WZSq5g9D
	 f+NxS27AUp81hYMso6ATyUNtlkrcuLL7LPmemKx6Y9rrwPLXcxmVTD0J6DfNxiJngkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H9NSzMlW;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211C606A329
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D211C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H9NSzMlW
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1395339a12.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714361; x=1794319161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
        b=k3c55daCCbS6LJmAWWnwCOBy52Zyf5haTlHGvD8g8VRvVDu6uSS5HlK0qbFb1DoEOy
         RLIbBsOdqIsubCFvPpWZV40O3MhEYZLSU+/iEqCUK4r6uzJJ1vu3vgWhPImBjb6iTFcK
         YcGZIZNdiZnm2GTG9LzYRTUGx4sWYb8mjLVBToDMEdO/PVT/D1VS9DjN/yz/ZuQr+7eT
         3mueKGprCn1IBFkwqo4ElSkav8VWBoCqVFm+6h/R0vBixmAuvYd/fX6QpgB3+GHqHG/v
         C1isHz3CaMiNBmBauMbrHDguHPSXnhY/nUQ+R4kTfMT/5bpPnwZCV3AqNIFbN0IGyPfu
         7G8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/m0F9zbCp4O+XYpYMHqHiFhrOJ+kMXG5TJPwFS7JXzBRpz+qa3WB1iNsuwqjR1PMme0k0/STMCHk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9adLXyZRV0phze5ysK2WaWbKZNbJ1PkBELB4hX2xpw218Jbboj
	/WLyxeyN9806m5YMKANozJ8ZMkFt36WrMzfYxxEmh/0bOQokjPKKHr/I6j0IEULiFyBRp3ihB01
	uUmeQdWX8iPAcW4NwZwx7GTvs06tno3N11xYJkImxzSVU4HevGZQP4B0brAvmMbjuFGEOMo85rf
	WbzIFoLfRGKP+2Rfo/NSgqk6kAMva1+lETindDDzB9/MpGEmwPshSVoYrQM0F9sw6U3H+fA+AiV
	tk2/8I3S5NnQVnkigPj6Q==
X-Gm-Gg: AYBFou0JK/fZVygbyVKREui0ZuMQV/6kJOoNkkTEjxyoRTM+pGDvyzEQvfbPOmqnJkq
	BzFkEWTZRAdJuP9xihEiMxBf762IFhdbE8w6W8E+11HlydJakaE7Hpez+l/liLCrWkvKveHjZ8p
	ME9aUIV8dOvGTxM58luwD/IEQXU+nqmADp2RtFTvHTc9JG1pH3eM9hvS/+2ZYUFhUtqYgVmyv9+
	8/QkYc4Dsqc1/3JU5PISRINXouyZ8lKn9oil14vgwXti9/J2BQecgJE7bnHPSHcZ6mweQ3TqQkg
	Z4oG/BWBP30mcu/hCyFx98ojpfY4oriRlXX3dXbFjVa/Aw0Tos8TceP8aO55iWc1r943yvNkmbu
	zRMoU9K41wHOOkh52Y4TQisxkTalqStaPfW9Sy0x3BPD8+ibgbzBNP2/0hQRRfgvTQagsTIvGdX
	kxY4H+pdq2p2kcqy3ztcTlrAJl5VkfHI2TdXuCfsE=
X-Received: by 2002:a17:90a:d887:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ae897c94e8mr11559317a91.10.1793714361249;
        Tue, 03 Nov 2026 05:59:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cab84edsm1845458a91.7.2026.11.03.05.59.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1110024c88.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714359; x=1794319159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
        b=H9NSzMlWRPOk0WSXa/Q623hQXA9mQmGf3XHdnDR8tM2JEw+ReRQ60zFKWpyrm4+0Ld
         pMdRHhpQpEBPE7zaH1qTF1F1kw0p6yd7F7QpIZDFdeTRpCuebk/MP1hBc67ir74jMmp4
         IpZeGtAHBjA/6AtutnOcqA96rZth78q2DM+CU=
X-Forwarded-Encrypted: i=1; AKwUvBxkRext7AH2XmCuEUHu9CO5158hmOkY8gENd9QZP6ajTilwN+TAZSkUITIDDNaaDdwmva+jJ7LJxGI=@lists.linux.dev
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr19735549c88.27.1793714359386;
        Tue, 03 Nov 2026 05:59:19 -0800 (PST)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr19735501c88.27.1793714358682;
        Tue, 03 Nov 2026 05:59:18 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:17 -0800 (PST)
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
Subject: Re: [PATCH 03/13] wifi: brcmfmac: Fall back to RSSI-only default join preferences
Date: Tue,  3 Nov 2026 14:58:47 +0100
Message-ID: <20261103135856.3676311-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-3-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-3-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:38 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware rejects the default join preference containing a 5 GHz
> RSSI boost with -EBADE, but accepts an RSSI-only preference.
>
> Retry with RSSI-only selection only after -EBADE. Log other errors
> without retrying.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 ++++
>  1 file changed, 4 insertions(+)
