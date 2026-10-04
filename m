Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB44443DEA5
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116963; cv=none; b=tuE6RksHKZt0BwT5aO4wJH0YGFokOpSVyl0eMATfVXzEkt9bemLbsuwT+6nQXt4GOzyTANDa/We2mV2VFgv2rMjp0xBw2CJe9YlWbyKEiNfMsyNvu5IweUg+o+l5gAL3apI4r/l09VGqnWQRq85hOcg7OoKNhLPuQempIzBiRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116963; c=relaxed/simple;
	bh=tjCJ1OLd4bESmRn4ltE+OeVIx/6AdbNp7qosZGyVn/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nav7ghONNJb9kFrguvIiQcU3E8jR4S8tEjw0+29gB+GXD66pnX+trKtiWOBypCgcZ9ST2CFm5M/hwNMrTMhsqPXKyB6wtaXKWuY+5nS/RZc/AZArDfAHW4kPMEUW8coC1sl4yU20dvlp3SlXooc3B6jLtcuUWXFol/m5iUyJcdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JYvoMlUe; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JYvoMlUe"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-824e6e6ed71so667478a34.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116959; x=1791721759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPmsD6wMbwGyIjjK6id1o7siDpKmgW9pQeTfa7Jr/0s=;
        b=pXSoJBenpy3ccbj5/d9b3nslO8mJU+Rzb3KVN6LehLMQf1aZDn0wp0NTZpI8A9uh8F
         3YOu2mS2JHUDxsSWQE3sBskoupEJNED4/IBzeHdcUKaeRYhBF//7Fwg8/yd/VpAcG1GR
         8d6sg8wJ60o6CveOMbZ4SczXLQbMKmQYUWNSESxjhx+u7oKmorWLjmgvm5RggRbq7JwP
         j4gFkTzhtDxIAKxR4f/IFIyFbZFJGdCowOwj6E0DVHs+sQ0lpL+D6Gts6OKu2aJyWBgk
         yEz7tkniAX+MZiVq8P9yett+gVIGLrfP4jkspKt5rQ/eNHKZ05+QUwxA4V2m6ZOIJmD7
         6d2g==
X-Forwarded-Encrypted: i=1; AKwUvBzmX8tGdeylPBmjk0HHfmd2zXcXsYgwiLR4+qFpp5ddKSvITn/4gje8VdoVcqNDWZZfTmSM9qTneMA=@lists.linux.dev
X-Gm-Message-State: AFuF++kb4CR+ws/UAz6Iro9f1qbHZ7n5q+4Srm6zy663Vx93ya1QHrdV
	b2Oh1qtJpGluBtevKodtr03SwyRZdhX6xLWwzwVWlxJpP+KRmdPwUt49pc4QzjAB/kjw0LWdpn2
	AhDZ46LSPuxjhbs3urWbIVsnGfvepKvUklgByICYAf+JosJFMSchOwr9i8JenaY/Qe7yWmQGEtV
	D7B3rF/Iwutyo2E01X0TUoUc6ayM3TKvsWv3ASoLnbN27C4uOm4ju4lZ6dBiVJMevxDB5GdX4Sw
	nr4ABS+vJxhlQUd2xaHhg==
X-Gm-Gg: AYBFou04ff4Vb01/+eDqdDLuiRFsHwDB+DBNgFyQF1hZkO+6IJo/UbtmqkTba6cc7SQ
	+tbJVv8tEfRlkVf+w2xj6cw1DQ2yBKEtgscBzjALoMYdtCzzBi8Ia42weanu0M3bjZFksghJkd4
	5EpMZ6x619BSpI1JoNeDLjDz3P3fPr60VGaTxhEY98K+QUhrCUc0u3rCaVRY20NwCL7wKeExE4Z
	FTON5cDhr0xgK/yWug09umH9X0Js+9pHhjo1y4aZq7cc28Cb2klqpRVrTGaC94RWOnEreV6Ugrg
	PlVEsDLUYpnZsmeVsYW4RNHiDK3El1e0dkzIhqpV09so9I2p/CXs1U6NTmEEXpFI/dgMG7+MVap
	ZdKE0jvsoi/vLerTSNCsUNsxJuIOwymdiNbFrKd8Po62cnqiOek75wLBoxwWZWGE7hBTdylmGgJ
	JDArK0SqOgwz9VfILXjwx8a/QNnS4cn1t/QQt3tI8wMA==
X-Received: by 2002:a05:6830:2b27:b0:804:ca33:4aff with SMTP id 46e09a7af769-823fc830d62mr4778479a34.9.1791116959437;
        Sun, 04 Oct 2026 05:29:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-82279b7921fsm1116017a34.7.2026.10.04.05.29.18
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:29:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d84114044so4648093eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116957; x=1791721757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPmsD6wMbwGyIjjK6id1o7siDpKmgW9pQeTfa7Jr/0s=;
        b=JYvoMlUeDTmMi0TfUAgeVuvYdtEs8GRtUXddMnEiuQbcGEx5JuJsZ8RehB7QAyG+pb
         vZh8eC3CPKs8LOo9Xk1CBQ1CB62wduVY+Pva0R05SV1/7dxS9IcJVukb/SkLK3sgxen8
         PfzEyEWen3tBgxAY17PxPb4dm+QU7H29NMb78=
X-Forwarded-Encrypted: i=1; AKwUvBzxl15AeLg36863W+VfVVxpPxdIXrXAduDEeD+snJSMwh7PKNuRkY0nYfGac5gPvavMCF1JcXmr2Yc=@lists.linux.dev
X-Received: by 2002:a05:7022:7e8a:b0:143:298f:33b8 with SMTP id a92af1059eb24-151c4c11b5amr10031761c88.44.1791116956797;
        Sun, 04 Oct 2026 05:29:16 -0700 (PDT)
X-Received: by 2002:a05:7022:7e8a:b0:143:298f:33b8 with SMTP id a92af1059eb24-151c4c11b5amr10031715c88.44.1791116956147;
        Sun, 04 Oct 2026 05:29:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35126f01924sm4803605eec.0.2026.10.04.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:29:15 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll context
Date: Sun,  4 Oct 2026 05:29:10 -0700
Message-ID: <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930185417.61865-1-kmehltretter@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 30 Sep 2026 20:54:17 +0200, Karl Mehltretter wrote:
> With the default fcmode=0, netpoll calls ndo_start_xmit() with hard
> interrupts disabled and reaches brcmf_sdio_bus_txdata() directly. The
> function takes txq_lock with spin_lock_bh(), and the queue helper takes
> the embedded sk_buff_head lock. These locks may sleep on PREEMPT_RT.
> On non-RT, spin_unlock_bh() can run pending networking softirqs before
> netpoll releases the transmit lock, causing a recursive transmit
> deadlock.
> 
> Use spin_trylock() for IRQ-disabled calls and enqueue with the unlocked
> skb helper while holding txq_lock. On PREEMPT_RT, reject hard IRQ and NMI
> callers, where rt-spinlocks cannot be acquired. If the lock is busy or
> the queue is full, return through the existing drop path. Do not evict an
> older packet from this context. Suppress the queue-full printk because
> netconsole can recursively enter this path.
> 
> The flow-control callback takes another spinlock, so defer it when an
> IRQ-disabled enqueue reaches TXHI. The data worker rechecks the bus state
> and queue length under txq_lock before stopping the queue. Existing TXLOW
> handling wakes the queue after it drains.
> 
> This fixes the direct SDIO transmit path used by fcmode=0. Modes 1 and 2
> take the FWS lock first and need a separate change.
> 
> Fixes: ac3d9dd034e5 ("netpoll: make ndo_poll_controller() optional")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

[...]

> @@ -2796,8 +2797,53 @@ static bool brcmf_sdio_prec_enq(struct pktq *q, struct sk_buff *pkt, int prec)
>  	return p != NULL;
>  }
>  
> +/*
> + * The caller holds txq_lock with hard IRQs disabled. Avoid the skb queue
> + * lock, which may sleep on PREEMPT_RT.
> + */
> +static bool brcmf_sdio_prec_enq_irqoff(struct pktq *q, struct sk_buff *pkt,
> +				       int prec)
> +{
> +	struct sk_buff_head *list = &q->q[prec].skblist;
> +
> +	if (pktq_pfull(q, prec) || pktq_full(q))
> +		return false;
> +
> +	__skb_queue_tail(list, pkt);
> +	q->len++;
> +	if (q->hi_prec < prec)
> +		q->hi_prec = prec;
> +
> +	return true;
> +}

Looking at brcmf_sdio_prec_enq(), it performs essentially the same check on
its fast path (!pktq_pfull(q, prec) && !pktq_full(q)) before calling
brcmu_pktq_penq(), and only falls back to packet eviction when the queue is
full.

Since bus->txq_lock is always held by the caller, using the unlocked
__skb_queue_tail() is safe in both contexts (the embedded skblist spinlock
in brcmu_pktq_penq() has always been redundant in sdio.c).

Is there an opportunity to reuse/refactor brcmf_sdio_prec_enq() rather than
adding a separate brcmf_sdio_prec_enq_irqoff() helper? For example, passing
a can_evict parameter:

static bool brcmf_sdio_prec_enq(struct pktq *q, struct sk_buff *pkt, int prec,
				bool can_evict)
{
	struct sk_buff_head *list = &q->q[prec].skblist;
	struct sk_buff *p;
	int eprec = -1;

	/* Fast case, precedence queue is not full and we are also not
	 * exceeding total queue length
	 */
	if (!pktq_pfull(q, prec) && !pktq_full(q))
		goto enq;

	if (!can_evict)
		return false;

	/* Determine precedence from which to evict packet, if any */
	if (pktq_pfull(q, prec)) {
		eprec = prec;
	} else if (pktq_full(q)) {
		p = brcmu_pktq_peek_tail(q, &eprec);
		if (eprec > prec)
			return false;
	}

	/* Evict if needed */
	if (eprec >= 0) {
		/* Detect queueing to unconfigured precedence */
		if (eprec == prec)
			return false;	/* refuse newer (incoming) packet */
		/* Evict packet according to discard policy */
		p = brcmu_pktq_pdeq_tail(q, eprec);
		if (p == NULL)
			brcmf_err("brcmu_pktq_pdeq_tail() failed\n");
		brcmu_pkt_buf_free_skb(p);
	}

enq:
	__skb_queue_tail(list, pkt);
	q->len++;
	if (q->hi_prec < prec)
		q->hi_prec = prec;

	return true;
}

Then in brcmf_sdio_bus_txdata():

	if (!brcmf_sdio_prec_enq(&bus->txq, pkt, prec, !irq_off)) {
		skb_pull(pkt, bus->tx_hdrlen);
		if (!irq_off)
			brcmf_err("out of bus->txq !!!\n");
		ret = -ENOSR;
	} else {
		ret = 0;
	}

That keeps the queuing logic in one place, eliminates the duplicate helper,
and simplifies the caller.

Regards,
Arend
