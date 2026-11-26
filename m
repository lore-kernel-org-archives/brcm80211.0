Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703381;
	b=usbnqM8YbjgodJIo/40UUN8k0tcNaLMcFO2pp9FS5BILt7AQf2YmuLX6Hld3ObcnPuYY
	 YEE+H7zoI9i5PF73Sd3SH1zaY/BsbyXKqTz/KDwGS2OsFIRYiFQ96aIExar8vf7A+BVsZ
	 0riTv5L5XhB0NtCfgTL5Hv0ZR72D1STiIaQVkbEeAt1MR1JCDGZxia5N1L9HEhXRwCYlz
	 S3RKHwa4jMxZP047mlwocR+rJBqNWBQbgWYMNf0/k5hOFRbEjlWlsN6JAe+O7FealmpB8
	 rpIWU9KUU2FNW8CabaQsQfkkm3AKEDFAIZgtzDf45lC6zVbIbeKfZpr5LqgT1DVBUFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703381;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SBkxFfdI6OFdLjN6um8D4P6aW28HTQiU9au3tlLimmQ=;
	b=M1SjDmleXFzjZ8fa5lnTWMWGpQt7GTbcqXYoXD+vfwVdc77Sv116FT93NMMGfd5srXVZ
	 RfGVcp/oWIx08GYyvJtjOtN3irxWoU6Q0qXFeXeeWOzMrm9PB5gWKwPpZR65T3Uu9MLKv
	 NRu5qtVXzKb3gLkDaepll5u6C6MsRKRxbEfygKTvF//HAsa5krrymwVDeEKN+ChYU7e3S
	 dHfAaimxKyRk+fNj3lAX2cCcIuVAvaCEsMMcK8g3RmTR3UI0kyV7oNXoTA/QvQ6cZacCD
	 lq1bC8ecVAB90vUadgwyZvdte7n50o99lvOQUg2sCf5BVqMfNWpe5FLsajepACIB4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XUKAyx4p;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F339606A31E
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F339606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XUKAyx4p
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4547835a12.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703380; x=1796308180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBkxFfdI6OFdLjN6um8D4P6aW28HTQiU9au3tlLimmQ=;
        b=OfnLsWGlwMDPzlvxIxZA21rNCoFxyct6p6R546+wEZ3xAIONqy17Vut8Z1uHpzx8lo
         F/K/ymYyg1RpTDD1gPYhrRXwndaLZdoQwLlvINP4Jn1j31Tthjw+7qIKJ41ViYd3S+HI
         W6quNflA3qURrTk7bTh20tgLGwiF7Ima+JYVHNCHQiUSyuqIHXeH5K7Xs4vPD+Sz2R3Y
         MB3bKhw+1LrNjl3OncuaeF7a0QQfDNdkPWF5oCA5B/MUQ7hUdmeAMrFCPnk9pp5tliA2
         rca4FZVEkAkLlgjygnJmDc65nXvpnmux2VglRf8tEUgPnPaeXdlLXegTDtfKYvgQJFlf
         EE5A==
X-Forwarded-Encrypted: i=1; AL+hErHwdwJdz4RsVrl0uidW4aGGgoorTHTKAI0SwVuvnIRlgKHMHGXCKALV7ANgkbqKs/SaQwisDIxREbE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8YQ8cOxJjfiUfgzRSFI/eDVJHEzxtmIgi8STzozPL5EpKB7uD3
	1Q5BS1LO69295eRXkKd4op37Mi+G+iYYhfGE7TX8nkx2sFFCgn0mAMWBkylQIeeisImVDzK6hta
	FXsuEoXqcxcLP2JTyljmOOl5DY2hOJNSl7qfZtBjfUL6m9CZ2DfqgJx3QtNuphLi9NSbvvqH5/o
	3kNJLgSmWeVaBMgCGDy+Txf/nVJRPVYvWKjBBHilirr9PwTPzxpr9pbXYegv7cdTbbMSGGAM3BX
	yH1fJjnrWw2kNtEOlw=
X-Gm-Gg: AZFdTZdflhj++PopGeU8ceKR5ga4bIHJzKn6F0K1d2oBXBqlSrYYUsLBfWpBVLp00f+
	X5e+IuvFAHRErOSsbYFAVpk1uB4XB90m6uagMcu2S92o95fAiG2BT3XTv/zvAZj7hdKsiWcJKxj
	rxMYa4fuHxiKuPWM2IrKKTvVQSMc9omUyQdVXeG7HCJ/xEiTfsqfy6LcbyNDDjKtozQmn/CV6Lf
	S++PeUJld4/8sFlZbHSb+XoKxwsLRv9CAqyvCmN4zXFq/+BxxCCsmtZhpz3U85CA3MzIY32p9/d
	fKrS1MFGBdBcOX+h4+GXK3oWcwCNKIA+Od78iSgbE5YQ4OW9aJAdgw+LRvTujJrxogyIFIGpseK
	Ei+K/Ai+8BFjojJRIhtpnjlnyTiY4EaltotIjaGoY+qdDfUiaK+j7vUWxdEPY2o7AzySFv5FJfL
	oXa3bOpxgvXyziI44NhOST3UaDaUGzJk8gc+qXNsP7pA==
X-Received: by 2002:a17:90b:2648:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b41c95b67fmr19191693a91.52.1795703380437;
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42a5a2de9sm13957212a91.5.2026.11.26.06.29.40
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b937ecbb4so116895636d6.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703379; x=1796308179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBkxFfdI6OFdLjN6um8D4P6aW28HTQiU9au3tlLimmQ=;
        b=XUKAyx4pzCfwdXkGzSEF7ckR8TbraKByTB8aWVeN1aP94YawUDJg6O0eQP2VsbqV0I
         XBDliFQc0V/1aJwahII+ajjwdBielCeY5Y/fZ8Xa8AYu2NfZ35oCYBMXcr/RK7cvqxaD
         omwHNFTRNr6ZPF5AD0yCClo+3nlxs5kxoVsek=
X-Forwarded-Encrypted: i=1; AL+hErHpYteWGogWctULPUhtp6ipSZRdUBZFlyZNgqPdU/OYw7hq1dKjs9y97S6FOLas6APx08IQ7soNIUY=@lists.linux.dev
X-Received: by 2002:a05:6214:318b:b0:921:1042:c46e with SMTP id 6a1803df08f44-92134b32b0cmr388369866d6.33.1795703378964;
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
X-Received: by 2002:a05:6214:318b:b0:921:1042:c46e with SMTP id 6a1803df08f44-92134b32b0cmr388369366d6.33.1795703378380;
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless-next 1/3] wifi: brcmfmac: pcie: stop console read on invalid write index
Date: Thu, 26 Nov 2026 15:29:31 +0100
Message-ID: <20261126142933.875175-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-2-sorencoremans@gmail.com>
References: <20261105215954.184290-2-sorencoremans@gmail.com>
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

On Thu,  5 Nov 2026 22:59:52 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> When the device drops off the bus, MMIO reads return all ones. The
> console write index then never matches read_idx, which wraps at
> bufsize, so brcmf_pcie_bus_console_read() loops forever and floods the
> kernel log with 0xff characters at several thousand lines per second.
>
> Seen on a BCM4366 after a firmware trap followed by a fatal PCIe error
> (FCP): the reset path and the failed dongle setup both entered the loop
> and never reached device_release_driver().
>
> Return early when the write index lies outside the console buffer.
>
> Found and written with the help of an AI coding assistant (Claude Opus
> 5.5); the cover letter describes how.
>
> Fixes: 9e37f045d5e7 ("brcmfmac: Adding PCIe bus layer support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

You may add my acknowledgement in v2.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
