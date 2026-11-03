Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714347;
	b=r+T30Ws0zLrk5bztf9cNkWKZODQfLbIWLQhb1cfx24KX5Dnhgeg8ZptvWcB6qiFOUYsA
	 BhfMF74vEQVLMdKVY0ZIXe54O6R3goN6JeNL4ipwqqS4aCjkwo/jEPnYYglwP3vfoS5jL
	 /JxKFPDdZFyOehrUVl3+gg+sI1yhH0Swp7R1F7P+mIEwpW3lEx8Mq3qctqgWLozxC/Ood
	 1pAF0qbjzkv8iTX/qrxKdv0ByUAsZDQIZgkIV/t8VVRkQJJdfVnrS/1HeX5RQtSroHWFK
	 G0OgY73FhlYyuOCAqe3B51TefHrfnxoeR7dWvy58rvFXrEVcbrW92vB7EBCycOZ0VmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714347;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
	b=y+K0R/HljpggckvbLtaYUZ2XEx9b1i8yaIDUc7whSV0fL7HEjHDGqg2keJTX8hBsH4eD
	 96aMZSnuAPc556nMdPanRTAaep0ENoeJcbd+0m5hXtyrHaqZpX4F1QFZB3MojHcZ9Y/O7
	 4v/gYRetYcIxDUJY8Ow7hp6PJh1a+IYvz+o2VQWlZ6KVxfLIErak37gWtWfqwRKV7nV69
	 iJ/QIHJDk31nKKxmx6SujBGYwnWJY1O4NvBl1eG90f7yBlz7R6JISLAFMlqztW64biQby
	 BmRJIewi4al8bjeejc4qWLrq9zZPa/vfwK5i0ca3++ZkO9mBYJjjVQL2K1NTSiA9y2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JeODP2nC;
	arc=none smtp.remote-ip=209.85.210.228
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E1606A328
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF9E1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JeODP2nC
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso1408467b3a.2
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714346; x=1794319146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
        b=YglueBOik4tnbTH0VFTCbzzSAHJ3+eShc93yO1WHuqLlVK14nzrUiY39S4y191QpWl
         tTmRNWp1+ZHwo+nSp+NhKaKW76Qkb2lutY0dtzBhlPf1LogUaTY7QMYsRF67mf/7qb/x
         1PvJjEhXe98+aN67mE5H+Hu7re20/GVlRgwcdcfy+Kpfcd3UhuGE0DQ0eHOFDFF4UHib
         yqWhmnunqxN2arIpSGhztQv2wRb83VWLmuTEhIXnfk2Z8D6fvlVlV5j64Hl5qkyodppg
         nG5W2AyAyLd0V0Kx0ylICPL1BK+Km9to8q1DKOjEtl45YHRzcW2mv4aZSqUBdrQYDeNO
         3s3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3XKdgf5gFYGx9Nq7t4dW6/TNsAqZajqzfVOKpRkYBCyed1W+B1rdv7pvZPYQPSoz2bql87E4sCxI=@lists.linux.dev
X-Gm-Message-State: APuU4Z95QvvGIYLTge08lG0eFsyboDaq82Ja9BGtg3pbwPfhuSTfxmFj
	06zk9y+zW/kZ+2FFXUs9EznfcOsrpIi2jrDKS+d+9SGMw+ISiAFqlh6VCgUb9FWQ0wsQuWqivHr
	1e/xqWNT8Y5T8nlXYCiDZ7VQy06cX7qCBcck03QKnPyfjorzOYh+v2hnsfArUmhirvlp8YE+1h6
	+Cbra7w0l+/yLbbSuRaD43t5aWWJipUrLvX0EkhaQOuQnKB6gUDW1wrH+CDs2ao9Jaegt6yO6lr
	t/8gdFSpzhBs7Lmhnz05A==
X-Gm-Gg: AYBFou26aagvIb6g7oQIY2HXYGhAHnG47fNa3lpavknt9bI93zv+DC3n5azhxaZNXV5
	H7hjHii0jvdLsU7RMb7uWINxagDuk0PjSo+oe3tiHyOa6OgZteuVvcrcBZ3qHZxzWcpm6Xcz7VC
	qo7/eFdmsP9V1XKde7OTF6ccnPwG2MjsUp1M0lBc/69dqczOY0eMxomT+Z8s8Ki2y8Ob2wTw/4k
	5pslfX3rkua8FsWSC6VEPlLIDSIIdRSk2VmBy3VelDjLzHfiqxObKXPB7MRg65aNVHG/bzVlytX
	RRYjfW8tFeVGWRVlK+bEzkkZf/yHgh6OJ6jUlActdimMDWAwZvKvmV3RAPUaIFZSXrBjG1XYej7
	MnXb0lsemUhr20nyNCCAK7KYzHxa6ZOnIc+yQrxJuwvRGN8wBhgdk+j1ReuKa0PE0HmapeQyJ+N
	JScfCbcrhTuELyy1IWxXQF//WLGvqKCGLpHNIItlA=
X-Received: by 2002:a05:6a00:c0ce:10b0:89c:967a:a74a with SMTP id d2e1a72fcca58-8ab04149d86mr6039964b3a.22.1793714346259;
        Tue, 03 Nov 2026 05:59:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8addc7fe7d8sm59320b3a.1.2026.11.03.05.59.05
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso11396866eec.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714344; x=1794319144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
        b=JeODP2nCgQpDReltOHK8Dnfiv4D/7Ya2DRhKINkadJqRZeiHkWPkOjmNgCkJ72/6yJ
         1Hs2xBzBcb2cuhfHUxfhPjK1arfa0H86tC3olU5gaX5/EojSfgdxj/VOXdwuf9Qy/9te
         HmRKuUocrgMUQYLXLPCL6An0hH9tYhhL6huwc=
X-Forwarded-Encrypted: i=1; AKwUvBxNjsSgF+6E1na7sAdwU8t/i8QMpFPRE8NpqiqtGLLa9TrdDn+5Ff/ylwwXwZ/2yJXmr699hjpxqSI=@lists.linux.dev
X-Received: by 2002:a05:7022:ea55:20b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1ac5da7726bmr20328270c88.31.1793714344132;
        Tue, 03 Nov 2026 05:59:04 -0800 (PST)
X-Received: by 2002:a05:7022:ea55:20b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1ac5da7726bmr20328216c88.31.1793714343237;
        Tue, 03 Nov 2026 05:59:03 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:02 -0800 (PST)
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
Subject: Re: [PATCH 04/13] wifi: brcmfmac: Support newer PCIe core startup and interrupts
Date: Tue,  3 Nov 2026 14:58:44 +0100
Message-ID: <20261103135856.3676311-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-4-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-4-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:39 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Newer Broadcom chips, such as BCM4388, require changes to PCIe register
> access, watchdog reset, and RAM size detection. PCIe core revision 64
> and higher uses a different BAR0 register window. ChipCommon revision 65
> and higher requires a different watchdog reset sequence.
>
> Update register access and reset for these revisions. Decode the SYSMEM
> bank counts according to the core revision and exclude ROM banks from
> RAM size calculation. Disable all detected D11 cores during CA7 setup
> and select H2D doorbells based on the firmware DAR flag.
>
> In MSI mode, firmware can clear the mailbox interrupt status before the
> host reads it. Requiring a nonzero status can therefore discard valid
> interrupts. Process ring events without that requirement when MSI is
> enabled. Use release/acquire ordering on irq_ready to publish the
> initialized rings before the interrupt thread accesses them.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  35 +++-
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 197 ++++++++++++++++-----
>  .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>  3 files changed, 183 insertions(+), 54 deletions(-)
