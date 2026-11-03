Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714385;
	b=BP1JP/H1h8A0m8MBhuCcqmT0o/yRkNVb+Vy2szUrk0WCWzTw1pwtaOWTRU+0HP8pIQE6
	 PIksD47jtrClFi9gYBZ9WiHCEHKnF2MA5VlHJ6aOm+5XyrlIrUUCkB9t0g4BKI8nDPz1p
	 kG42JJZjq4LkPft3mgF7e8PJMdLkZHG8YXcgGrxYXAOcVB1W+jq/wtX3sAaKJv4wwTzn1
	 VogpJmKntFKz3pfSaKe0zSX9BPI0Jz5pT7K/h/0yhXGAAvxIZY9NLri+Ri569OPLCYJMU
	 WeTr5LC+o36n09/L+S8gvRwa+4snHQLCTwND0zAhKzVEHho3pJK+LtX0sr/m6ciqc9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
	b=LTpv7QOlSdS1mcoERmozbIYQT7o6Zh40Yx3e3CTEvpC29RUROmatMAc5tU3pygPGtP8+
	 u47aMZtxj5F6/hS+9SchjucW1nMkuBOku+ZVlhiJSYcwQc3x/nOajQslGCSsepPsliLLd
	 spyrS3UEHeNWHaVOB0TDC5I8C3Re46ymxrQOH1MG1v2Z05rRRPJ1PJEzbQ6kLZDBJBslT
	 Mkz+Q3Hc1MPHD0J8CC57qZwczHclx6WqQMOgL8VzMl5kMsViUXleLXitzho1PcfXpob42
	 W7zIbRbyVTCIh/O+hL2EaV6+p6vjkQGfs7aIuHDfTrVZGl2UiM4d+sK5qi/YZIyBo0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uipi7eEs;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0A26082BF0
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0A26082BF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uipi7eEs
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93e635220b4so411727585a.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714384; x=1794319184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
        b=skX68Di8ZFyxHJe51X1IkXmEbcKqvR8o+vWMjYsJgCChWzsTPruGMSwB4SkJdSvoAh
         eezt6vAsFjwZzpwuoi696mD9q4JNsn6Vq0mDayU2vKaByg777V56MfBvmBYZ8OwdWzIB
         zHCQaoi8Ez/CuDm+02lQs9s79fONXUBAFga4BnzRToyVEgAMF8EVph4wFrKd4uVP+94l
         UZ8dTxHH/9kSdFTGk3LOUoUFyXmC+KCoNdqmlE/usWKsl6FcY+NkWt6iUP9SXpmdG4JM
         kQp6XhiP1mVd5n4pUiFRQ/hcmf+7kp49F9ghay9IgDuiKduqFPfbhvZDtC9IjGKckm00
         InPg==
X-Forwarded-Encrypted: i=1; AKwUvBxJEI+LQIGwmYM4VtegwGkzrIgTLiweppBQbFX+D34eZXIUjms4zmFxrT4Ugna56ivixYJOcEFFlnQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/VGMX5czCpthTfRHkdwdU4hZ1NvR2kVNU21KLT/t8gJCN9qnGY
	qmIZmzbEkDP62qnC65bP5XOxJvGrqOw1oHwH4mEWrPW6WkU7Lc676lTbHDqIxm4jAjaAofdDZrd
	NkyoQxJZSG8UQJq54VcyyY9gbmjR0Ix8uMuU8RAEZg3eqbj3UbBAM2MpNvBPvaOA+3yxCxqGrYC
	4gQfNoB8vaXNTunFzWQWuZD2u+b4IqeHwf6i+lPPNzwGKrGYfP7J9b89lHggiVC6W4wRYnqD7SM
	ev5qljZJwcFmiNp6BNgsQ==
X-Gm-Gg: AYBFou17Ok9pDxjTGtpocoXJLUUAhe4M/KERoZujVk9qyQn8qBKbnmb62PozDew3p/7
	4EIDkBBNa6mUWSwOQOQk8WduZRmBusLmlE45mgaJUi6OB1t39Nt8gwXNGYUStf2ZR4WbQn6CuPy
	bTSd16PPJPogsapyNj+5AlTpXhG/PxUT9uIBWhB9JqBKaW/3GWHKGX6y7UJE77KglJNqbM/MDh3
	YVIpX03fEw0MoCsAJeCEaZQUfm+rlPUuswsZ3alz5f2Ii2Ar0zS8ALcxCGBxwCG5TT0ZEnsS1qz
	E+GQrpPWWtQ76RqAfs4m/C8DxDWjpKB3hzkHWYeOEXttEEOgp6uUsVS6SadBWSsvjQzjq9iGOHt
	lgN24OoToI6mHymoRXsOq30IQ6SawSLKXQVmAZ+oyKRmUUsSl1JEONYi7zbNO5JxbDjX4Jp1X40
	xxDCbp9ECdMTYjsexkgyik/+xhr1GUS8FoNsSh1GQ=
X-Received: by 2002:a05:620a:17a3:b0:943:b01a:78f8 with SMTP id af79cd13be357-944214dc9bcmr2057093285a.5.1793714384294;
        Tue, 03 Nov 2026 05:59:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91e75d2cc7bsm100986d6.38.2026.11.03.05.59.43
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4029525c88.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714383; x=1794319183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR67u4JxnjJub76U3ECbURlUoxwJMuJHoq+jVOWi5Uc=;
        b=Uipi7eEsraJGVdDE6KjLCZSZaUjxjPuL6qpjh7UBtxpZh71HtUeZu2fKY8OO2IadMC
         5TAkbDLyg8EbO/dbGmzldbQUS88UW6Bb7WcrJxg2Ck5Uy9ducSvi/JG5BCGbIA1a5i77
         St2TucVI+OuxC4dSfvOrieeW19GlL3dXhmH64=
X-Forwarded-Encrypted: i=1; AKwUvBzDG6OQUDzlp6LFfyg3di/iXQ526gaQi+0QP6gl8BzvtHjca/2cm0xoh9FK3aDDMPEFDWB5glHvVDQ=@lists.linux.dev
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr19489907c88.35.1793714382838;
        Tue, 03 Nov 2026 05:59:42 -0800 (PST)
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr19489867c88.35.1793714382225;
        Tue, 03 Nov 2026 05:59:42 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:40 -0800 (PST)
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
Subject: Re: [PATCH 07/13] wifi: brcmfmac: Use event_msgs_ext for event masks
Date: Tue,  3 Nov 2026 14:58:52 +0100
Message-ID: <20261103135856.3676311-9-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-7-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-7-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:42 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware rejects the legacy event_msgs query during preinit but
> supports the structured event_msgs_ext command.
>
> Probe event_msgs_ext during feature detection and initialize the event
> mask after feature flags are set. Use the extended command when
> supported and retain the legacy path otherwise.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c  |  23 ----
>  .../wireless/broadcom/brcm80211/brcmfmac/core.c    |   5 +-
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  39 +++++++
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.h |   2 +
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.c    | 130 ++++++++++++++++++++-
>  .../wireless/broadcom/brcm80211/brcmfmac/fweh.h    |   1 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  26 +++++
>  7 files changed, 199 insertions(+), 27 deletions(-)
